+++
title = "New vim tricks"
slug = "new-vim-tricks"
url = "/2012/09/27/new-vim-tricks"
date = "2012-09-27T15:18:55.000Z"
+++

I've been using Vim since 2006, and it's still my favorite text editor. My current job requires me to live in Visual Studio, so I'm using <a href="http://visualstudiogallery.msdn.microsoft.com/59ca71b3-a4a3-46ca-8fe1-0e90e3f79329">VsVim</a>, a mostly-compatible Vim mode layered on top of the Visual Studio editor. My <a href="https://github.com/snay2/configs">.vimrc file</a>, plugins, and syntax files are on my GitHub account.

Since Vim is such an important part of my development toolset, I'm always interested to learn new tricks and techniques to make it more efficient. A coworker gave a presentation on Vim today. It was intended as an introduction, but he managed to teach me quite a few useful new things in the process. Here are a few of them:

<ul>
<li><code>e</code> Move to the last letter of the current word (useful with <code>w</code> and <code>b</code>)</li>
<li><code>%</code> Move to the parenthesis/curly brace/square bracket corresponding to the one under the cursor</li>
<li><code>f&lt;character&gt;</code> Find the next (or previous, with <code>F</code>) occurrence of the given character on this line</li>
<li><code>:g!//d</code> Remove all lines not matching a search previously done with / (not in VsVim)</li>
<li><code>CTRL+R "</code> Paste the unnamed register while in insert mode</li>
<li><code>diw</code> With the cursor in the middle of a word, delete the word</li>
<li><code>c$</code> Delete to the end of the line (or any other motion) and switch to insert mode</li>
<li><code>:55</code> Move to line 55, opening any code folds if necessary (easier and more robust than <code>55gg</code>)</li>
<li>Move to the line at the top (<code>H</code>), bottom (<code>L</code>), or center of the screen (<code>M</code>), respectively</li>
<li><code>zz</code> Center the current line in the screen, or move it to the top (<code>zt</code>) or bottom (<code>zb</code>)</li>
</ul>

Here are a few favorites that I've learned over the past few months:
<ul>
<li><code>*</code> Find the next occurrence of the current word</li>
<li><code>gqq</code> Wrap the current line (or <code>gq</code> for a visual block) to 80 characters, modifying line breaks if necessary. Useful for plain text documents.</li>
<li><code>=</code> Normalize the code indentation for the selected block</li>
</ul>