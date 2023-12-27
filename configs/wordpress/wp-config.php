<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db' );

/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', 'wp_password' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ' 4k_Bz#(f 7&|Y`#5hIwi`z)&|# N<[ZPX5^](=gZ8c3ex08l?!WD;,,L~oAEo4Y' );
define( 'SECURE_AUTH_KEY',  '(w/Qodv0N6!-s|aH4ABTnQp(8Z5QviGaQo&eD=5D7OTa+Vd-x::6{.`E(.>4+u,[' );
define( 'LOGGED_IN_KEY',    'C|i(@13hm?2y%wocL#Xy&wkis=Kq2c>@a-%c3zLTw)VN=*+B~tt6HX#jdywD6+>Q' );
define( 'NONCE_KEY',        'W#JSU]+3z)n_pq!:]C&sFQ:$K%>cfD%a#3g{T=R%*P/Qm[9mcKV^wXR8W21I=*!S' );
define( 'AUTH_SALT',        '1nTf`vg7BqI]/;^h#K9duY>4.bh@nX11(/H-+^Gzn:q>uDE-D_*#F!.P[eo|Mxny' );
define( 'SECURE_AUTH_SALT', '&+ybZ>;0de#}so(1eO,W71/x}A;.G/I?@Pt@PktvEm}xV6u9XuEYuvtmCUze_5IL' );
define( 'LOGGED_IN_SALT',   'rj=e7.fN8I]1:O%i&|0Tw/i=`q9` KqwIu[ATiG$ kg+Cz*DhB.dG*AW$@VON6i|' );
define( 'NONCE_SALT',       'n4EJS>xl<!M8^LjW)E3xkdO(18W2Hz>cKA&Y_3Pd$&hq2PB=x<5;31*g jPJNmHw' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
