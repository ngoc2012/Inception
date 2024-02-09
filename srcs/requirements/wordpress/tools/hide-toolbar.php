<?php
/*
Plugin Name: Hide Admin Toolbar
Description: Hide the WordPress admin toolbar on the front end for non-admin users.
*/

// Hide WordPress admin toolbar on the front end
if (!current_user_can('manage_options')) {
    add_filter('show_admin_bar', '__return_false');
}