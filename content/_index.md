+++
author = "Jesper Lillesø"
description = "Jesper Lillesø's personal website." # Set your site's meta tag (SEO) description here. This overrides any description set in your site configuration.
keywords = ["photo", "classic cars", "nerd"] # Set your site's meta tag (SEO) keywords here. These override any keywords set in your site configuration.
+++
{{ define "main" }}
  <main aria-role="main">
    <header class="homepage-header">
      <h1>{{ .Title }}</h1>
      {{ with .Params.subtitle }}
        <span class="subtitle">{{ . }}</span>
      {{ end }}
    </header>
    <div class="homepage-content">
      <!-- Note that the content for index.html, as a sort of list page, will pull from content/_index.md -->
      {{ .Content }}
    </div>
    <div>
      {{ range first 10 .Site.RegularPages }}
        {{ .Render "summary" }}
      {{ end }}
    </div>
  </main>
{{ end }}