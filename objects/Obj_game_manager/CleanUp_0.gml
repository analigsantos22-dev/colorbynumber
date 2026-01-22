if (variable_instance_exists(id, "strawberry_scanner")) {
    if (surface_exists(strawberry_scanner)) {
        surface_free(strawberry_scanner);
    }
}