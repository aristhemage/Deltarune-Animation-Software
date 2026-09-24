function find_original_owner(obj) {
    if (variable_instance_exists(obj, "owner")) {
        return find_original_owner(obj.owner);
    } else {
        return obj;
    }
}