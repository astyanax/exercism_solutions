<?php

function language_list(...$langs): array
{
    return $langs;
}

function add_to_language_list(array $list, string $lang): array
{
    return [...$list, $lang];
}

function prune_language_list(array $list): array
{
    array_shift($list);
    return $list;
}

function current_language(array $list): string
{
    return $list[0];
}

function language_list_length(array $list): int
{
    return count($list);
}