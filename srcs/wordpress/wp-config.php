<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );
/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '{p;7Y(mA48`w~XbaW%)rdQjRHtB`Lu:kuLd}|{@j;eO@Z.GLbdSiJZ@X`,a#Cs(T' );
define( 'SECURE_AUTH_KEY',  'WN{Yrmk5%:[^;])^pP1m-}_j[9p+h#=~S|qadr8q),g/@knhY*P[~a GfE~Hj:a=' );
define( 'LOGGED_IN_KEY',    '9F*%yS,kuFFHDb662{%Tt=pGdo]v~iS>K<=1]`2IY@9v%Xj]#Br*BNPY(V8j(45C' );
define( 'NONCE_KEY',        'Q54.^)tdN![s7Gufxk1ZM{.AT{7=lF_Ki?Wm.vie5cJC+LBP`%$}ebFaoikTiv[B' );
define( 'AUTH_SALT',        'NuzC8{:FOA4K]/B~Z,Fyr3ph-#4b, 8Z?eM=`F%Nk.x+&~YU75P{,OaKq|QQXpmd' );
define( 'SECURE_AUTH_SALT', 'OYh3[-zrG#}w[Gx_EaApMZpdBH,-x8eZ`?;.gzg[KWc{xfy/]Uvy#c1%/GEX8 Fh' );
define( 'LOGGED_IN_SALT',   '*Nl+En&qYw6-h6:S6|Qx|3]kE`ZWx[fVt}u(J{94Yq{28PMau$.]y;QX da><[,w' );
define( 'NONCE_SALT',       'y6s`{UCaAT3&HEjq6d(EX`uCSX=5 :9S]-`q4X]& Vo,U1CFq2$7qfCIkx3Z$5p-' );

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
