# Compass Chameleon

Chameleon is a theming/skinning extension for Compass. Chameleon allows you to
define themes and output themed CSS properties for each theme.

Imagine each section on your website having its own color scheme (primary color,
secondary color, tertiary color and so on). With Chameleon it's a breeze to
reuse the general styles and only change colors based on the theme.

## Installation

Install Chameleon by:

```bash
$ gem install compass-chameleon
```

## Usage

```scss
// First, set up your themes.
// Each theme is a list, consisting of two items: the theme-name {string} (this
// is what you would apply as a class to the container or body element) and the
// colors {list | color}, where the colors are ordered: primary theme color,
// secondary theme color, tertiary theme color etc.
//
$themes: ("red",   (#FF0000, #F13333)),
		 ("green", (#00FF00, #33F133)),
		 ("blue",  (#0000FF, #3333F1));

// Next, import Chameleon
@import "chameleon";

// Then, use the mixins to output themed properties
.page-title {
	border-bottom: 1px solid;
	@include themed(border-color, color);
}
```

This will output:

```css
.page-title {
  border-bottom: 1px solid;
}

.red .page-title {
  border-color: red;
  color: #f13333;
}

.green .page-title {
  border-color: lime;
  color: #33f133;
}

.blue .page-title {
  border-color: blue;
  color: #3333f1;
}
```

In your HTML you'd add the theme name class to the `body` element to theme an entire page, or to a `div` or `section` or so to skin a component:

```html
<!-- Add the theme name class to the body element to theme an entire page: -->
<body class="red">
  <!-- content -->
</body>

<!-- Or to a container to skin a component: -->
<section class="blue">
  <!-- content -->
</section>
```

## Mixins

Chameleon comes with a number of mixins for your theming pleasures:

### `themes`

Adds a *global* style rule for each theme, containing the themed properties.  Takes one or more CSS properties. Useful to set up theme classes that have styling themselves. Note: If you specify more properties than available colors for a theme, only the available property color pairs will be output.

Usage:

```scss
$themes: ("red",   (#FF0000, #F13333)),
         ("green", (#00FF00)),
         ("blue",  (#0000FF, #3333F1));

@include themed(background-color);
```

Output:

```css
.red {
  background-color: red;
}
.green {
  background-color: lime;
}
.blue {
  background-color: blue;
}
```

### `themed`

Adds a style rule for *each* theme, containing the themed properties. Takes one or more CSS properties. Note: If you specify more properties than available colors for a theme, only the available property color pairs will be output.

Usage:

```scss
$themes: ("red",   (#FF0000, #F13333)),
         ("green", (#00FF00)),
         ("blue",  (#0000FF, #3333F1));

.page-title {
  // In this case, theme `green` only has one color, it will only output the `background-color` property
  @include themed(background-color, color);
}
```

Output:

```css
.red .page-title {
  background-color: red;
  color: #f13333;
}
.green .page-title {
  background-color: lime;
}
.blue .page-title {
  background-color: blue;
  color: #3333f1;
}
```

### `properties-for-theme`

Adds a style rule for the *given* theme, containing the themed properties. Takes a theme, one or more properties (remember, a theme is a list of a name and a list of colors) and optionally whether to output the stye rule on the global level (without the parent selector) or not (default it will output *with* the parent selector). Useful for those situations where only one theme is different. Use in conjunction with the `get-theme-by-name` function.

Usage:

```scss
.foo {
  // First, look up the theme named 'red'
  $theme: get-theme-by-name("red");
  // Then, add the `color` property only for the `red` theme
  @include properties-for-theme($theme, color);
}
```

Output:

```css
.red .single {
  color: red;
}
```

## Functions

Chameleon uses a number of functions internally, but you can use them in your projects as well:

### `get-theme-by-name`

Returns a theme by its name. Takes a theme name.

```scss
.foo {
  // First, look up the theme named 'red'
  $theme: get-theme-by-name("red");
  // Then, use $theme in a mixin include or in a style rule
}
```

### `theme-colors`

Returns a list of the colors of the theme. Takes a theme.

```scss
  // First, look up the theme named 'red'
  $theme: get-theme-by-name("red");
  // Next, get the theme colors
  $colors: theme-colors($theme);
  // Then, use $colors in a for loop or whatever
```

### `theme-color`

Returns the desired color (primary, secondary etc.) of the specified theme. Takes a theme and the desired color by ordinal number (primary color is 1, secondary color is 2, tertiary color is 3 etc.).

```scss
.foo {
  // First, look up the theme named 'red'
  $theme: get-theme-by-name("red");
  // Then, use the tertiary color of that theme in this border property
  border: 3px dashed theme-color($theme, 3);
}
```

## License

MIT License, see [LICENSE.txt](LICENSE.txt).