<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>{$lang.title} SUB Billing</title>
	<link rel="stylesheet" type="text/css" href="templates/style.css">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
{literal}
<script name="javascript">
function checkAll(check) {
var boxes = document.def.elements.length;
if(check) {
	for(i=0; i<boxes; i++) {
		document.def.elements[i].checked = true;
	}
} else {
	for(i=0; i<boxes; i++) {
		document.def.elements[i].checked = false;
	}
}
}

function confirmation(warn_msg) {
	return(confirm(warn_msg));
}
</script>
{/literal}
</head>
<body>
<table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0">
<tr>
	<td align="center" valign="center">
		<img src="./templates/img/logo.png">
	</td>
	<td colspan="2" height="60">
		<div id="title">SUB Billing</div>
		<div id="subtitle">{$lang.subtitle}</div>
	</td>
{if $news_page eq 1}
	<td rowspan="2" valign="top" width="250">
		<font class="news_title">{$lang.news}</font><br>
		{if !$news}<center><font class="news_date">К сожалению сейчас нет ни одной новости.</center>{/if}
		{section name=news loop=$news}
			<font class="news_date">{$news[news].time|date_format:"%e %B %Y | %H:%M"}</font><br>
			<font class="news_text">{$news[news].text}</font><br><br>
		{/section}
	</td>
{/if}
</tr>
<tr>
	<td id="nav_menu">
	<table border="0" cellspacing="0" cellpadding="4">
{foreach from=$menu item=menu_item key=menu_key}
	<tr>
	{if $menu_key eq $curr_menu}
		{if $curr_submenu}
			<td><a href="{$menu_item.url}">{$menu_item.title}</a></td>
		{else}
			<td><b>&raquo; {$menu_item.title}</b></td>
		{/if}
		{if $menu.$curr_menu.sub|@count}
			{foreach from=$menu.$curr_menu.sub item=submenu_item key=submenu_key}
				<tr><td>&nbsp;&nbsp;&nbsp;
				{if $submenu_key eq $curr_submenu}
					<b>&raquo; {$submenu_item.title}</b>
				{else}
					<a href="{$submenu_item.url}">{$submenu_item.title}</a>
				{/if}
				</td></tr>
			{/foreach}
		{/if}
	{else}
		<td><a href="{$menu_item.url}">{$menu_item.title}</a></td>
	{/if}
	</tr>
{/foreach}
	<tr>
		<td><a href="login.php?logout=1">{$lang.logout} ({$login})</a></td>
	</tr>
	</table>
	</td>
	<td id="cont">
	<h2><a href="{$menu.$curr_menu.url}">{$lang.$curr_menu}</a>
	{if $curr_submenu}
	/ <a href="{$menu.$curr_menu.sub.$curr_submenu.url}">{$lang.$curr_submenu}</a></h2>
	{else}
	</h2>
	{/if}
