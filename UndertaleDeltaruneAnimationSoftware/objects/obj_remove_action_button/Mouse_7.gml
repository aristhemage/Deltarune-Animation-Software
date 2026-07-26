if (!instance_exists(owner))
    exit;

// Don't let the user delete the last box.
if (array_length(obj_action_master.boxes) <= 1)
    exit;

obj_action_master.remove_box(owner);