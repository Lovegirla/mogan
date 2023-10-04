<TeXmacs|2.1.2>

<style|<tuple|tmdoc|devel>>

<\body>
  <tmdoc-title|Handle indentation of first paragraph of section>

  First paragraph of a section may not be indented in English document, but
  must be indented in Chinese document. Macros such as <markup|yes-indent>
  should be used to achieve this task by toppling value of
  <src-var|par-no-first> in cpp code. To improve user experience, style
  package should be improved and UI should be alterred.

  <section|Tasks>

  <\wide-tabular>
    <tformat|<cwith|1|-1|2|2|cell-background|>|<cwith|1|1|2|2|cell-background|pastel
    grey>|<table|<row|<\cell>
      Bug
    </cell>|<\cell>
      <dlink|46_1>
    </cell>|<\cell>
      jingkaimori
    </cell>|<\cell>
      Default value of <src-var|par-no-first> does not match default behavior
    </cell>>|<row|<\cell>
      Feature
    </cell>|<\cell>
      <dlink|46_2>
    </cell>|<\cell>
      jingkaimori
    </cell>|<\cell>
      Toggle indent of paragraph in <menu|Format|Paragraph> menu
    </cell>>|<row|<\cell>
      Feature
    </cell>|<\cell>
      <dlink|46_3>
    </cell>|<\cell>
      \;
    </cell>|<\cell>
      Improve first indent in package <tmpackage|indent-paragraphs>.
    </cell>>|<row|<\cell>
      Doc
    </cell>|<\cell>
      46_4<rsub|>
    </cell>|<\cell>
      \;
    </cell>|<\cell>
      Improve documet of <src-var|par-no-first>
    </cell>>>>
  </wide-tabular>

  <tmdoc-copyright|2023|jingkaimori>

  <tmdoc-license|Permission is granted to copy, distribute and/or modify this
  document under the terms of the GNU Free Documentation License, Version 1.1
  or any later version published by the Free Software Foundation; with no
  Invariant Sections, with no Front-Cover Texts, and with no Back-Cover
  Texts. A copy of the license is included in the section entitled "GNU Free
  Documentation License".>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|preamble|false>
  </collection>
</initial>