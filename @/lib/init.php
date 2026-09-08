<?php

$baseUrl = "/e";
$basePath = $_SERVER['DOCUMENT_ROOT'] . "/e";

function pathOf(string $path): string {
    global $basePath;
    return $basePath . $path;
}
    
function urlOf(string $url): string {
    global $baseUrl;
    return $baseUrl . $url;
}

function get(string $key) {
    return $_GET[$key];
}

function post(string $key) {
    return $_POST[$key];
}

function exitWithRedirect(string $url) {
    header('Location: ' . urlOf($url));
    exit();
}
