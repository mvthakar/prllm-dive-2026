<?php

class Database
{
    public static ?Database $instance = null;
    public static function getInstance() : Database
    {
        if (Database::$instance === null) {
            Database::$instance = new Database();
        }

        return Database::$instance;
    }

    private PDO $pdo;

    private function __construct()
    {
        $this->pdo = new PDO(
            "mysql:host=localhost;dbname=dive_ecommerce_db",
            "root",
            ""
        );
    }

    public function getOne(string $query, array $params = []) : object | null
    {
        $statement = $this->pdo->prepare($query);
        $statement->execute($params);

        $result = $statement->fetch(PDO::FETCH_OBJ);
        return $result;
    }

    public function getAll(string $query, array $params = []) : array
    {
        $statement = $this->pdo->prepare($query);
        $statement->execute($params);

        $result = $statement->fetchAll(PDO::FETCH_OBJ);
        return $result;
    }

    public function execute(string $query, array $params = []) : bool
    {
        $statement = $this->pdo->prepare($query);
        return $statement->execute($params);
    }
}
