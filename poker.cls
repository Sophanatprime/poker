%%     This is file `poker.cls'
%%     Copyright (C) 2021--2021
%%     Wenjian Chern (Longaster) and any individual authors listed elsewhere in this file.
%%  --------------------------------------------------------------------------
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. This version of this license is in
%%         http://www.latex-project.org/lppl/lppl-1-3c.txt
%%     and the latest version of this license is in
%%         http://www.latex-project.org/lppl.txt
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2005/12/01 or later.
%% 
%%     This work has the LPPL maintenance status `maintained'.
%% 
%%     The Current Maintainers of this work is Wenjian Chern (Longaster).
%%  --------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\RequirePackage{amsmath,mathtools,empheq}
\RequirePackage[colortbl]{xcolor}
\RequirePackage{varwidth}
\RequirePackage{tikz}
\usetikzlibrary{calc,fadings}
\RequirePackage[most]{tcolorbox}
\ProvidesExplClass{poker}{2021/12/03}{0.1}{poker class}
\RequirePackage{l3keys2e}
\RequirePackage{l3draw}
\tex_input:D { ./cwmacro-utils.tex }

%% basic class commands
\cs_set_protected_nopar:Npn \normalsize {\fontsize{8pt}{10pt}\selectfont}
\dim_set:Nn \paperwidth { 57mm } \dim_set_eq:NN \textwidth \paperwidth
\dim_set:Nn \paperheight { 87mm } \dim_set_eq:NN \textheight \paperheight
\newif\iffontspecavali
\bool_lazy_or:nnTF 
  { \sys_if_engine_luatex_p: } { \sys_if_engine_xetex_p: }
  { \tl_const:Nn\poker@fontspec{1} \fontspecavalitrue } 
  { \tl_const:Nn\poker@fontspec{0} \fontspecavalifalse }

\ExplSyntaxOff
\pagenumbering{arabic}
\pagestyle{empty}
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@viiipt{9.5}%
   \abovedisplayskip 8\p@ \@plus4\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 5\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@viipt\@viiipt%
   \abovedisplayskip 5\p@ \@plus2\p@ \@minus2\p@
   \abovedisplayshortskip \z@ \@plus1\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@vipt\@viipt
   \abovedisplayskip 1.5\p@ \@plus\p@ \@minus\p@
   \abovedisplayshortskip \z@ \@plus.5\p@
   \belowdisplayshortskip 1\p@ \@plus\p@ \@minus.7\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 1.5\p@ \@plus\p@ \@minus.7\p@
               \parsep 1.5\p@ \@plus\p@ \@minus.7\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@vpt\@vipt}
\newcommand\tinyscriptsize{\@setfontsize\tinyscriptsize{1}{1}}
\newcommand\TINYY{\@setfontsize\TINYY{2}{2.5}}
\newcommand\TINY{\@setfontsize\TINY{3}{3.7}}
\newcommand\Tiny{\@setfontsize\Tiny{4}{5}}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xpt\@xipt}
\newcommand\Large{\@setfontsize\Large\@xipt\@xiipt}
\newcommand\LARGE{\@setfontsize\LARGE\@xiipt{14}}
\newcommand\huge{\@setfontsize\huge\@xivpt{18}}
\newcommand\Huge{\@setfontsize\Huge\@xviipt{22}}
\hfuzz=1pt
\parindent=0pt
\hbadness=10000
\tolerance=10000
\raggedbottom

\iffontspecavali
\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
\setmathfont[math-style=TeX,bold-style=TeX]{Latin Modern Math}
\setmathfont[range={
  \mathopen,\mathclose, % open, close
  "2980, % fence
  "310, "312, "315, "31A, "20E7, % accent
  "27D5, "27D6, "27D7, "29F8, "29F9, "2A07-"2A21, % op
  "2040, "214B, "2219, "233D, "25EB, "27C7, "27D1, "27E4, "27E5, "29B5-"29C8, % bin
  "29CD, "29D6, "29D7, "29E2, "29EB, "29F5-"29F7, "29FA, "29FB, "29FE, "29FF, % bin
  "2A22-"2A2E, "2A40-"2A65, "2A71, "2A72, "2AF4-"2AF6, "2AFB, "2AFD, "2AFE, % bin
  "1B5, "3F6, "2025, "2038, "203C, "2043, "2047, "2132, "213C, "2145-"2149, "214A, % ord
}]{XITS Math}
\setmathfont[range={"210A, "210B, "2110, "2112, "211B, "212C, "212F, "2130, "2131, "2133, "2134, % scr, bfscr
}]{XITS Math}
\setmathfont[range={\mathscr,\mathbfscr}]{XITS Math}
\setmathfont[range={"5B,"5D,
  "1D538-"1D56B,"02102,"0210D,"02115, % bb
  "02119,"0211A,"0211D,"02124,"0213D-"0213F, % bb
}]{TeX Gyre Pagella Math}
\setmathfont[range={
  "28,"7B,"27E8,"27EA, % open
  "29,"7D,"27E9,"27EB, % close
  "2A09, "2A0C, % op
  \mathcal,\mathbfcal,
}]{Latin Modern Math}
\else
\RequirePackage{amssymb,amsfonts,upgreek}
\fi
\ExplSyntaxOn
\newcommand\pokercharfontfa{\normalfont\bfseries}

\RequirePackage{geometry}
\geometry{paperwidth=57mm,paperheight=87mm,textwidth=57mm,textheight=87mm}

\dim_new:N \leftoffset
\dim_new:N \rightoffset
\dim_new:N \topoffset
\dim_new:N \botoffset
\dim_new:N \pokercolwidth
\dim_new:N \pokercolheight
\dim_new:N \pokerboxwidth
\dim_new:N \pokerboxheight

\cs_generate_variant:Nn \clist_map_inline:Nn { Nx }
\cs_generate_variant:Nn \clist_map_inline:nn { nx }
\cs_generate_variant:Nn \seq_map_indexed_inline:Nn { Nx }
\cs_generate_variant:Nn \int_step_inline:nnnn { nnnx }
\cs_generate_variant:Nn \int_while_do:nNnn { nNnx }

\tl_new:N \g__poker_file_path_clist
\bool_new:N \g__poker_mode_poker_bool
\bool_new:N \g__poker_mode_article_bool
\cs_new:Npn \ppokermode { \bool_if:NT \g__poker_mode_poker_bool }
\cs_new:Npn \pifpokermode { \bool_if:NTF \g__poker_mode_poker_bool }
\cs_new:Npn \particlemode { \bool_if:NT \g__poker_mode_article_bool }
\cs_new:Npn \pifarticlemode { \bool_if:NTF \g__poker_mode_article_bool }
\bool_new:N \l__poker_auto_load_file_bool
\tl_new:N \poker@currname
\tl_new:N \poker@currfilename
\tl_const:Nn \poker@fileext { tex }
\cs_new_protected_nopar:Npn \pautoloadfile #1
  { 
    \bool_if:NT \l__poker_auto_load_file_bool 
      {
        \seq_set_from_clist:NN \l_file_search_path_seq
          \g__poker_file_path_clist
        \tl_set:Nx \l__poker_tmpa_tl 
          { \c_sys_jobname_str -poker- #1 . \poker@fileext }
        \tl_set:Nx \l__poker_tmpb_tl
          { \c_sys_jobname_str -poker- \poker@currname . \poker@fileext }
        \str_if_eq:eeTF \l__poker_tmpa_tl \l__poker_tmpb_tl
          {
            \file_if_exist:nTF { \l__poker_tmpa_tl }
              { 
                \iow_log:n { (Poker)\c_space_tl \poker@currname : \c_space_tl autoload: \c_space_tl \l__poker_tmpa_tl }
                \file_input:n { \l__poker_tmpa_tl }
              }
              {
                \msg_warning:nnx { poker } { file-not-exist } 
                  { \l__poker_tmpa_tl }
              }
          }
          {
            \file_if_exist:nTF { \l__poker_tmpb_tl }
              { 
                \iow_log:n { (Poker)\c_space_tl \poker@currname : \c_space_tl autoload: \c_space_tl \l__poker_tmpb_tl }
                \file_input:n { \l__poker_tmpb_tl }
              }
              { 
                \file_if_exist:nTF \l__poker_tmpa_tl
                  { 
                    \iow_log:n { (Poker)\c_space_tl \poker@currname : \c_space_tl autoload: \c_space_tl \l__poker_tmpa_tl }
                    \file_input:n { \l__poker_tmpa_tl }
                  }
                  {
                    \msg_warning:nnx { poker } { file-not-exist } 
                      { \l__poker_tmpa_tl }
                  }
              }
          }
      }
  }
\msg_new:nnn { poker } { file-not-exist } { File~`#1'~not~exists. }

%% options
\keys_define:nn { poker }
  {
    paperwidth .code:n = \geometry { paperwidth = #1 } ,
    paperheight .code:n = \geometry { paperheight = #1 } ,
    textwidth .code:n = \geometry { textwidth = #1 } ,
    textheight .code:n = \geometry { textheight = #1 } ,
    leftoffset .dim_set:N = \leftoffset ,
    rightoffset .dim_set:N = \rightoffset ,
    topoffset .dim_set:N = \topoffset ,
    botoffset .dim_set:N = \botoffset ,
    hoffset .meta:n = { leftoffset = {#1} , rightoffset = {#1} } ,
    voffset .meta:n = { topoffset = {#1} , botoffset = {#1} } ,
    offset .meta:n = 
      { 
        leftoffset = {#1} , rightoffset = {#1} , 
        topoffset = {#1} , botoffset = {#1} 
      } ,
    offset .initial:n = 7mm ,

    mode .choice: ,
    mode / poker .code:n = 
      \bool_gset_true:N \g__poker_mode_poker_bool 
      \bool_gset_false:N \g__poker_mode_article_bool 
      \cs_set_eq:NN \ppokermode \use:n 
      \cs_set_eq:NN \pifpokermode \use_i:nn 
      \cs_set_eq:NN \particlemode \use_none:n 
      \cs_set_eq:NN \pifarticlemode \use_ii:nn ,
    mode / article .code:n = 
      \bool_gset_false:N \g__poker_mode_poker_bool
      \bool_gset_true:N \g__poker_mode_article_bool 
      \cs_set_eq:NN \particlemode \use:n 
      \cs_set_eq:NN \pifarticlemode \use_i:nn 
      \cs_set_eq:NN \ppokermode \use_none:n 
      \cs_set_eq:NN \pifpokermode \use_ii:nn ,

    twoside .choice: ,
    twoside / true .code:n = \@twosidetrue \@mparswitchtrue ,
    twoside / false .code:n = \@twosidefalse \@mparswitchfalse ,
    twoside .default:n = true ,
    oneside .choice: ,
    oneside / true .meta:n = { twoside = false } ,
    oneside / false .meta:n = { twoside = true } ,
    oneside .default:n = true ,
    frontandback .meta:n = { twoside = true } ,
    frontonly .meta:n = { twoside = false } ,

    poker~font~name .code:n = 
      \if_int_odd:w \poker@fontspec \exp_stop_f:
        \renewfontface\pokercharfontfa{#1}
      \fi: ,
    poker~file~path .clist_gset:N = \g__poker_file_path_clist ,

    poker~index~function .cs_set:Np = \__poker_name_by_index:n #1 ,
    poker~auto~load~file .bool_set:N = \l__poker_auto_load_file_bool ,
    poker~auto~load~file .default:n = true ,
    poker~file~extension .tl_set_x:N = \poker@fileext ,
    poker~curr~file .tl_set:N = \poker@currfilename ,
    poker~curr~file .initial:n = \poker@currname ,
  }

\ProcessKeysOptions { poker }

\legacy_if:nTF { @twoside }
  {
    \cs_new_eq:NN \poker_clear_front: \cleardoublepage
    \cs_new_eq:NN \poker_clear_back:  \clearpage
  }
  {
    \cs_new_eq:NN \poker_clear_front: \clearpage
    \cs_new_eq:NN \poker_clear_back:  \clearpage
  }

%% aux
\cs_new_protected_nopar:Npn \poker_save_space:
  { \char_set_catcode_space:n { 32 } }
\cs_new_protected_nopar:Npn \poker_space_reset:
  { \char_set_catcode_ignore:n { 32 } }

% https://tex.stackexchange.com/questions/412899/
\cs_new_protected_nopar:Npn\pointdistance#1#2#3{
  \tikz@scan@one@point\pgfutil@firstofone($#1-#2$)\relax
  \pgfmathsetmacro{#3}{round(0.99626*veclen(\the\pgf@x,\the\pgf@y)/0.0283465)/1000}}
\tl_new:N \l__poker_tmpa_tl
\tl_new:N \l__poker_tmpb_tl
\seq_new:N \l__poker_tmpa_seq
\seq_new:N \l__poker_tmpb_seq
\clist_new:N \l__poker_tmpa_clist
\clist_new:N \l__poker_tmpb_clist
\newtoks \l__poker_tmpa_toks
\newtoks \l__poker_tmpb_toks
\dim_new:N \l__poker_tmpa_dim
\dim_new:N \l__poker_tmpb_dim
\dim_new:N \pokertmpdim
% toks support
\cs_new_protected:Npn \poker_toks_new:N #1
  {
    \__kernel_chk_if_free_cs:N #1
    \cs:w newtoks \cs_end: #1
  }
\cs_generate_variant:Nn \poker_toks_new:N { c }
\cs_new_eq:NN \poker_toks_use:N \tex_the:D
\cs_generate_variant:Nn \poker_toks_use:N { c }
\cs_new_eq:NN \poker_toks_if_exist_p:N \cs_if_exist_p:N
\cs_new_eq:NN \poker_toks_if_exist:NTF \cs_if_exist:NTF
\cs_new_eq:NN \poker_toks_if_exist:NT \cs_if_exist:NT
\cs_new_eq:NN \poker_toks_if_exist:NF \cs_if_exist:NF
\cs_new_eq:NN \poker_toks_if_exist_p:c \cs_if_exist_p:c
\cs_new_eq:NN \poker_toks_if_exist:cTF \cs_if_exist:cTF
\cs_new_eq:NN \poker_toks_if_exist:cT \cs_if_exist:cT
\cs_new_eq:NN \poker_toks_if_exist:cF \cs_if_exist:cF
\cs_new_protected:Npn \poker_toks_set_eq:NN #1#2 { #1 = #2 }
\cs_new_protected:Npn \poker_toks_gset_eq:NN #1#2 
  { \tex_global:D #1 = #2 }
\cs_new_protected:Npn \poker_toks_set:Nn #1#2 { #1 = {#2} }
\cs_new_protected:Npn \poker_toks_gset:Nn #1#2 
  { \tex_global:D #1 = {#2} }
\cs_new_protected:Npn \poker_toks_clear:N #1 { #1 = {} }
\cs_generate_variant:Nn \poker_toks_clear:N { c }
\cs_new_protected:Npn \poker_toks_gclear:N #1 { \tex_global:D #1 = {} }
\cs_generate_variant:Nn \poker_toks_gclear:N { c }
\cs_new_protected:Npn \poker_toks_put_right:Nn #1#2
  { #1 \exp_after:wN { \poker_toks_use:N #1 #2 } }
\cs_generate_variant:Nn \poker_toks_put_right:Nn { cn, Nf, cf, No, co, Nv, cv, NV, cV }
\cs_new_protected:Npn \poker_toks_put_left:Nn #1#2
  {
    \exp_args:Nx #1 
      { \exp_not:n {#2} \exp_not:n \exp_after:wN { \poker_toks_use:N #1 } }
  }
\cs_generate_variant:Nn \poker_toks_put_left:Nn { cn, Nf, cf, No, co, Nv, cv, NV, cV }
\cs_new_protected:Npn \poker_toks_gput_right:Nn #1#2
  { \tex_global:D #1 \exp_after:wN { \poker_toks_use:N #1 #2 } }
\cs_generate_variant:Nn \poker_toks_gput_right:Nn { cn, Nf, cf, No, co, Nv, cv, NV, cV }
\cs_new_protected:Npn \poker_toks_gput_left:Nn #1#2
  {
    \exp_args:NNx \tex_global:D #1 
      { \exp_not:n {#2} \exp_not:n \exp_after:wN { \poker_toks_use:N #1 } }
  }
\cs_generate_variant:Nn \poker_toks_gput_left:Nn { cn, Nf, cf, No, co, Nv, cv, NV, cV }
%
\NewDocumentCommand \psetup { s m }
  { 
    \IfBooleanTF {#1} 
      { \keys_set:nn { poker/#2 } } 
      { \keys_set:nn { poker } {#2} } 
  }
\cs_set_nopar:Npn \poker_color_set:nn #1#2 
  { \colorlet{#1}{#2} \color_set:nn {#1} {#2} }
\cs_set_nopar:Npn \poker_color_set:nnn #1#2#3 
  { \definecolor{#1}{#2}{#3} \color_set:nnn {#1} {#2} {#3} }
\NewDocumentCommand \pcolorlet { m o m }
  {
    \IfNoValueTF {#2} 
      { \poker_color_set:nn {#1} {#3} } 
      { \poker_color_set:nnn {#1} {#2} {#3} } 
  }

\NewDocumentCommand\pmaplist{s}
  {\IfBooleanTF{#1}{\clist_map_inline:Nn}{\clist_map_inline:nn}}
\NewDocumentCommand\pstepint{s}
  {\IfBooleanTF{#1}{\int_while_do:nNnn}{\int_step_inline:nnnn}}
\NewDocumentCommand\pmaplisti{sm}
  {
    \IfBooleanTF{#1} 
      { \seq_set_from_clist:NN \l__poker_tmpa_seq #2 }
      { \seq_set_from_clist:Nn \l__poker_tmpa_seq {#2} }
    \seq_map_indexed_inline:Nn \l__poker_tmpa_seq
  }
\NewDocumentCommand\pemaplisti{sm}
  {
    \IfBooleanTF{#1} 
      { \seq_set_from_clist:NN \l__poker_tmpa_seq #2 }
      { \seq_set_from_clist:Nn \l__poker_tmpa_seq {#2} }
    \seq_map_indexed_inline:Nx \l__poker_tmpa_seq
  }
\NewDocumentCommand\pemaplist{s}
  {\IfBooleanTF{#1}{\clist_map_inline:Nx}{\clist_map_inline:nx}}
\NewDocumentCommand\pestepint{s}
  {\IfBooleanTF{#1}{\int_while_do:nNnx}{\int_step_inline:nnnx}}
\cs_set_eq:NN\pitemof\clist_item:Nn

\cs_new:Npn \poker_background:n #1
  {
    \hook_gput_code:nnn { shipout/background } { ./background }
      { \put(0,-\paperheight) {#1} }
  }
\cs_new:Npn \poker_next_background:n #1
  {
    \hook_gput_next_code:nn { shipout/background }
      { \put(0,-\paperheight) {#1} }
  }
\cs_new:Npn \poker_background_at:nn #1#2
  {

  }
\cs_new:Npn \poker_foreground:n #1
  {
    \hook_gput_code:nnn { shipout/foreground } { ./foreground }
      { \put(0,-\paperheight) {#1} }
  }
\cs_new:Npn \poker_next_foreground:n #1
  {
    \hook_gput_next_code:nnn { shipout/foreground }
      { \put(0,-\paperheight) {#1} }
  }

% ground base 
\hook_gput_code:nnn { shipout/before } { ./groundbase }
  {
    \poker_toks_new:c { poker@page \int_use:N \c@page @ground@hook }
  }
\cs_new_protected:Npn \poker_hook_appto_ground:nn #1
  { \poker_toks_put_right:cn { poker@page #1 @ground@hook } }
\cs_new_protected:Npn \poker_hook_gappto_ground:nn #1
  { \poker_toks_gput_right:cn { poker@page #1 @ground@hook } }
\NewDocumentCommand \papptoghook { s t+ m }
  {
    \IfBooleanTF {#1} 
      { \IfBooleanTF {#2} { \use_i:nn } { \use_i_ii:nnn } }
      { \IfBooleanTF {#2} { \use_none:nn } { \use_ii:nnn } }
      \exp_args:Nv \poker_hook_appto_ground:nn
      \poker_hook_gappto_ground:nn {#2}
  }
%

%% frame
\cs_new:Npn \__poker_draw_positionning:
  {
    \draw_path_moveto:n { -0.001mm , -0.001mm }
    \draw_path_lineto:n { -0.001mm , -0.001mm }
    \draw_path_use_clear:n { stroke }
  }
\cs_new:Npn \poker_draw_frame:
  {
    \draw_begin:
    \__poker_draw_positionning:
    \color_select:n { pokerframe }
    \draw_path_moveto:n { \leftoffset , 0cm }
    \draw_path_lineto:n { \leftoffset , \paperheight }
    \draw_path_moveto:n { \paperwidth - \rightoffset , 0cm }
    \draw_path_lineto:n { \paperwidth - \rightoffset , \paperheight }
    \draw_path_moveto:n { 0cm , \botoffset }
    \draw_path_lineto:n { \paperwidth , \botoffset }
    \draw_path_moveto:n { 0cm , \paperheight - \topoffset }
    \draw_path_lineto:n { \paperwidth , \paperheight - \botoffset }
    \draw_path_use_clear:n { stroke }
    \draw_end:
  }
\cs_new:Npn \poker_show_frame_next:
  {
    \poker_next_background:n { \poker_draw_frame: }
  }
\cs_new:Npn \poker_show_frame_all:
  {
    \poker_background:n { \poker_draw_frame: }
  }
\keys_define:nn { poker } 
  { frame .code:n = \keys_set:nn { poker/frame } {#1} }
\keys_define:nn { poker/frame }
  {
    next .code:n = \poker_show_frame_next: ,
    page .code:n = \prg_do_nothing: ,
    all .code:n = \poker_show_frame_all:,
  }
\NewDocumentCommand \pshowframe { O{} }
  {
    \keys_set:nn { poker/frame } {#1}
  }


%% update
\prop_new:N \g__poker_update@all_prop
\cs_new_nopar:Npn \poker_update_add:nnn #1
  { \prop_gput:cnn { g__poker_update@ #1 _prop } }
\cs_new_nopar:Npn \poker_update_use:nn #1#2
  {
    \str_if_eq:nnTF { #2 } { all }
      {
        \prop_map_inline:cn { g__poker_update@ #1 _prop } { ##2 }
      }
      {
        \clist_map_tokens:nn {#2}
          { \prop_item:cn { g__poker_update@ #1 _prop } }
      }
  }
\prop_new:N \g__poker_update@dim_prop


%% main box commands and environments
\msg_new:nnn { poker } { index-range }
  { Poker~index~must~between~1~and~54,~you~gave~`#1'. }
\cs_new:Npn \__poker_name_to_text:n #1
  { \exp_not:v { __poker@name@ #1 } }
\cs_new_nopar:Npn \__poker_name_by_index:n #1
  {
    \if_case:w \int_eval:w #1 \scan_stop:
      \msg_error:nnn { poker } { index-range } {#1}
    \or: 1+ \or: 1- \else:
      \if_int_compare:w \int_eval:w #1 < 55 \exp_stop_f:
        \clist_item:nn { A,2,3,4,5,6,7,8,9,10,J,Q,K }
          { \int_div_truncate:nn { #1 - 3 } { 4 } + 1 }
        \clist_item:nn { s, h, c, d }
          { \int_mod:nn { #1 - 3 } { 4 } + 1 }
      \else: 
        \msg_error:nnn { poker } { index-range } {#1}
      \fi:
    \fi:
  }
\cs_new:Npn \__poker_def_name:nnn #1#2#3 % name, text, color
  { \cs_new_nopar:cpn { __poker@name@ #1 } { \color{#3} #2 } }
\__poker_def_name:nnn { As }  {A\\\pspade} {pokercolors}
\__poker_def_name:nnn { Ah }  {A\\\pheart} {pokercolorh}
\__poker_def_name:nnn { Ad }  {A\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { Ac }  {A\\\pclub} {pokercolorc}
\__poker_def_name:nnn { Ks }  {K\\\pspade} {pokercolors}
\__poker_def_name:nnn { Kh }  {K\\\pheart} {pokercolorh}
\__poker_def_name:nnn { Kd }  {K\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { Kc }  {K\\\pclub} {pokercolorc}
\__poker_def_name:nnn { Qs }  {Q\\\pspade} {pokercolors}
\__poker_def_name:nnn { Qh }  {Q\\\pheart} {pokercolorh}
\__poker_def_name:nnn { Qd }  {Q\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { Qc }  {Q\\\pclub} {pokercolorc}
\__poker_def_name:nnn { Js }  {J\\\pspade} {pokercolors}
\__poker_def_name:nnn { Jh }  {J\\\pheart} {pokercolorh}
\__poker_def_name:nnn { Jd }  {J\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { Jc }  {J\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 10s } {10\\\pspade} {pokercolors}
\__poker_def_name:nnn { 10h } {10\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 10d } {10\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 10c } {10\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 9s }  {9\\\pspade} {pokercolors}
\__poker_def_name:nnn { 9h }  {9\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 9d }  {9\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 9c }  {9\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 8s }  {8\\\pspade} {pokercolors}
\__poker_def_name:nnn { 8h }  {8\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 8d }  {8\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 8c }  {8\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 7s }  {7\\\pspade} {pokercolors}
\__poker_def_name:nnn { 7h }  {7\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 7d }  {7\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 7c }  {7\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 6s }  {6\\\pspade} {pokercolors}
\__poker_def_name:nnn { 6h }  {6\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 6d }  {6\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 6c }  {6\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 5s }  {5\\\pspade} {pokercolors}
\__poker_def_name:nnn { 5h }  {5\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 5d }  {5\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 5c }  {5\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 4s }  {4\\\pspade} {pokercolors}
\__poker_def_name:nnn { 4h }  {4\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 4d }  {4\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 4c }  {4\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 3s }  {3\\\pspade} {pokercolors}
\__poker_def_name:nnn { 3h }  {3\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 3d }  {3\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 3c }  {3\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 2s }  {2\\\pspade} {pokercolors}
\__poker_def_name:nnn { 2h }  {2\\\pheart} {pokercolorh}
\__poker_def_name:nnn { 2d }  {2\\\pdiamond} {pokercolord}
\__poker_def_name:nnn { 2c }  {2\\\pclub} {pokercolorc}
\__poker_def_name:nnn { 1+ }  {J\\O\\K\\E\\R} {pokerred}
\__poker_def_name:nnn { 1- }  {J\\O\\K\\E\\R} {pokerblk}

\cs_new_protected:Npn \pspade { \ensuremath{\spadesuit} }
\cs_new_protected:Npn \pheart { \ensuremath{\varheartsuit} }
\cs_new_protected:Npn \pdiamond { \ensuremath{\vardiamondsuit} }
\cs_new_protected:Npn \pclub { \ensuremath{\clubsuit} }
\pcolorlet { pokerframe } { red }
\pcolorlet { pokerred } { red!80!black }
\pcolorlet { pokerblk } { black }
\pcolorlet { pokercolors } { pokerblk }
\pcolorlet { pokercolorh } { pokerred }
\pcolorlet { pokercolord } { pokerred }
\pcolorlet { pokercolorc } { pokerblk }
\pcolorlet { pokerbackground } { black!50!white }
\pcolorlet { darkgolden } [ RGB ] { 255,215,0 } % golden
\pcolorlet { pokertextcolor } { darkgolden }
\pcolorlet { brightgolden } [ RGB ] { 255,223,0 } % golden
\pcolorlet { pokermathcolor } { brightgolden }
\pcolorlet { pokerfront } { pokerbackground }
\pcolorlet { pokerback } { pokerbackground }
\pagecolor { pokerbackground }
\color { pokertextcolor }

\poker_save_space:
\box_new:N \poker@kernel@box
\newboxarray{poker@arraybox}
\cs_new_nopar:Npn\__poker_tcbbox_gstore:Nnw#1#2[#3]{\hbox_gset:Nw#1}
\cs_new:Npn\__poker_tcbbox_gstore_end:{\tex_unskip:D\hbox_gset_end:}
\tl_new:N\poker@envbegin@code
\tl_new:N\poker@envend@code
\tcbset{
  store box in/.code={\def\kvtcb@float{S}%
  \def\tcb@float@env@begin{\__poker_tcbbox_gstore:Nnw#1}%
  \def\tcb@float@env@end{\__poker_tcbbox_gstore_end:}},
  poker@boxstyle/.style={},
  no inner space/.style={boxsep=0pt,top=0pt,bottom=0pt,left=0pt,right=0pt},
  fit to poker box/.style={fit to={\pokerboxwidth} and \pokerboxheight},
  poker@name@box@style/.style={},
  poker engine empty/.style={frame engine=empty,interior titled engine=empty,interior engine=empty},
}
\tikzset{
  poker rightoffset/.code=\dim_set:Nn\rightoffset{#1},
  poker leftoffset/.code=\dim_set:Nn\leftoffset{#1},
  poker topoffset/.code=\dim_set:Nn\topoffset{#1},
  poker botoffset/.code=\dim_set:Nn\botoffset{#1},
  poker hoffset/.style={poker rightoffset={#1},poker leftoffset={#1}},
  poker voffset/.style={poker topoffset={#1},poker botoffset={#1}},
  poker offset/.style={%
    poker rightoffset={#1},poker leftoffset={#1},%
    poker topoffset={#1},poker botoffset={#1}},
  poker@nodestyle/.style={inner sep=0pt,outer sep=0pt,anchor=south west,minimum width=\pokerboxwidth,minimum height=\pokerboxheight},
  poker box/.code={\cs_set_eq:Nc\pokerbox{poker@#1box}},
  poker box/.default=minipage,
  poker show main grid/.code=\tl_put_right:Nn\poker@envbegin@code{%
    \pshowgrid[#1]},
  poker show main grid/.default={},
  poker show pos/.code=\tl_put_right:Nn\poker@envbegin@code{\pshowpos},
  poker name/.code=\tl_put_right:Nx\poker@envend@code{%
    \exp_not:N\pboxlefttext{\__poker_name_to_text:n{#1}}%
    \exp_not:N\pboxrighttext{\__poker_name_to_text:n{#1}}
  }\tl_set:Nx\poker@currname{#1},
  poker index function/.code=\cs_set_nopar:Nn\__poker_name_by_index:n{#1},
  poker index/.style={poker name={\__poker_name_by_index:n{#1}}},
  poker@name@node@style/.style={},
  poker box style/.code={\pgfkeys{/tcb/poker@name@box@style/.style={#1}}},
  poker node style/.style={poker@name@node@style/.style={#1}},
  poker box style+/.code={\pgfkeys{/tcb/poker@name@box@style/.append style={#1}}},
  poker node style+/.style={poker@name@node@style/.append style={#1}},
  poker auto load file/.is choice,
  poker auto load file/true/.code={\bool_set_true:N\l__poker_auto_load_file_bool},
  poker auto load file/false/.code={\bool_set_false:N\l__poker_auto_load_file_bool},
  poker auto load file/.default=true,
  poker curr file/.code=\tl_set:Nx\poker@currfilename{#1},
  poker file extension/.code=\tl_set:Nx\poker@fileext{#1},
}
\keys_define:nn {poker}
  {
    poker box style.code:n={\tcbset{poker@name@box@style/.style={#1}}},
    poker node style.code:n={\tikzset{poker@name@node@style/.style={#1}}},
    poker box style+.code:n={\tcbset{poker@name@box@style/.append style={#1}}},
    poker node style+.code:n={\tikzset{poker@name@node@style/.append style={#1}}},
  }
\NewDocumentEnvironment {pokerpage} { d() O{} +b } % tikz
  {\IfNoValueTF{#1}
    {\tl_set:Nn\poker@tmpsaved{\begin{tikzpicture}[}}%
    {\tl_set:Nn\poker@tmpsaved{\begin{tikzpicture}[poker index={#1},}}%
    \poker@tmpsaved#2]
    \path[use as bounding box] (0,0) rectangle (\paperwidth,\paperheight);
    \coordinate (poker above left) at (0,\paperheight);
    \coordinate (poker above right) at (\paperwidth,\paperheight);
    \coordinate (poker below left) at (0,0);
    \coordinate (poker below right) at (\paperwidth,0);
    \coordinate (offset above left) at (\leftoffset,\paperheight-\topoffset);
    \coordinate (offset above right) at (\paperwidth-\rightoffset,\paperheight-\topoffset);
    \coordinate (offset below left) at (\leftoffset,\botoffset);
    \coordinate (offset below right) at (\paperwidth-\rightoffset,\botoffset);
    \coordinate (poker center) at (.5\paperwidth,.5\paperheight);
    \coordinate (poker right golden) at (poker center-|.618\paperwidth,0);
    \coordinate (poker left golden) at (poker center-|.382\paperwidth,0);
    \coordinate (poker top golden) at (poker center|-0,.618\paperheight);
    \coordinate (poker bot golden) at (poker center|-0,.382\paperheight);
    \coordinate (main top golden) at (poker center|-0,{.618\paperheight-.618\topoffset+.382\botoffset});
    \coordinate (main bot golden) at (poker center|-0,{.382\paperheight-.382\topoffset+.618\botoffset});
    \poker@envbegin@code\pautoloadfile{\poker@currfilename}
    #3
    \poker@envend@code\end{tikzpicture}%
    \tl_gclear:N\poker@envbegin@code\tl_gclear:N\poker@envend@code}{}
\cs_new_protected:Npn\pokerfront{%
  \poker_clear_front:\pagecolor{pokerfront}\begin{pokerpage}}
\cs_new_protected:Npn\endpokerfront{\end{pokerpage}}
\cs_new_protected:Npn\pokerback{%
  \poker_clear_back:\pagecolor{pokerback}\begin{pokerpage}}
\cs_new_protected:Npn\endpokerback{\end{pokerpage}}
\NewDocumentCommand\pokerpagebox{ D(){} O{} +m }
  {\begin{pokerpage}(#1)[#2]#3\end{pokerpage}}
\NewDocumentCommand\pokerfrontbox{ D(){} O{} +m }{%
  \poker_clear_front:\pagecolor{pokerfront}\pokerpagebox(#1)[#2]{#3}}
\NewDocumentCommand\pokerbackbox{ D(){} O{} +m }{%
  \poker_clear_back:\pagecolor{pokerback}\pokerpagebox(#1)[#2]{#3}}
\NewDocumentCommand \poker@tcbbox { O{blanker} O{} m m +m } % tcbox, node, {wd,ht}, pos, box
  {\dim_set:Nn\pokerboxwidth{\clist_item:nn{#3}{1}}%
    \dim_set:Nn\pokerboxheight{\clist_item:nn{#3}{2}}%
    \begin{pgfinterruptpicture}%
      \begin{tcolorbox}[poker@boxstyle,width=\pokerboxwidth,height=\pokerboxheight,#1,store box in=\poker@kernel@box,]#5\end{tcolorbox}%
    \end{pgfinterruptpicture}%
    \node[poker@nodestyle,at={#4},#2]{\box\poker@kernel@box};}
\cs_set_eq:NN\pokerbox\poker@tcbbox
\NewDocumentCommand \poker@minipagebox { O{} O{} m m +m }
  {\dim_set:Nn\pokerboxwidth{\clist_item:nn{#3}{1}}%
    \dim_set:Nn\pokerboxheight{\clist_item:nn{#3}{2}}%
    \begin{pgfinterruptpicture}%
      \hbox_gset:Nn\poker@kernel@box
        {\begin{minipage}{\pokerboxwidth}#5\end{minipage}}%
    \end{pgfinterruptpicture}%
    \node[poker@nodestyle,at={#4},#2]{\box\poker@kernel@box};}
\NewDocumentCommand \poker@varwidthbox { O{} O{} m m +m }
  {\dim_set:Nn\pokerboxwidth{\clist_item:nn{#3}{1}}%
    \dim_set:Nn\pokerboxheight{\clist_item:nn{#3}{2}}%
    \begin{pgfinterruptpicture}%
      \hbox_gset:Nn\poker@kernel@box
        {\begin{varwidth}{\pokerboxwidth}#5\end{varwidth}}%
    \end{pgfinterruptpicture}%
    \node[poker@nodestyle,at={#4},#2]{\box\poker@kernel@box};}

\NewDocumentCommand \pleftbox { O{blanker} O{} +m }
  {\pokerbox[#1][#2]{\leftoffset,\paperheight}{(poker below left)}{#3}}
\NewDocumentCommand \prightbox { O{blanker} O{} +m }
  {\pokerbox[#1][#2]
    {\rightoffset,\paperheight}
    {(offset below right|-poker below right)}{#3}}
\NewDocumentCommand \pfrightbox { O{blanker} O{} +m }
  {\pokerbox[#1][scale=-1,#2]
    {\rightoffset,\paperheight}
    {(poker above right)}{#3}}
\NewDocumentCommand \pmainbox { O{blanker} O{} +m }
  {\pokerbox[#1][#2]
    {\paperwidth-\leftoffset-\rightoffset,\paperheight-\topoffset-\botoffset}
    {(offset below left)}{#3}}
\NewDocumentCommand \ptopbox { O{blanker} O{} +m }
  {\pokerbox[#1][#2]
    {\paperwidth-\leftoffset-\rightoffset,\topoffset}
    {(offset above left)}{#3}}
\NewDocumentCommand \pbotbox { O{blanker} O{} +m }
  {\pokerbox[#1][#2]
    {\paperwidth-\leftoffset-\rightoffset,\botoffset}
    {(poker below left-|offset below left)}{#3}}
\NewDocumentCommand \pwholebox { O{blanker} O{} +m }
  {\pokerbox[#1][#2]{\paperwidth,\paperheight}{(poker below left)}{#3}}

\NewDocumentEnvironment {pokerboxenv} { O{blanker} O{} m m }
  {\cs_set:Npn\poker@tmpsaved{\pokerbox[#1][#2]{#3}{#4}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {pleftboxenv} { O{blanker} O{} }
  {\cs_set:Npn\poker@tmpsaved{\pokerbox[#1][#2]
    {\leftoffset,\paperheight}{(poker below left)}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {prightboxenv} { O{blanker} O{} }
  {\cs_set:Npn\poker@tmpsaved{\pokerbox[#1][#2]
    {\rightoffset,\paperheight}
    {(offset below right|-poker below right)}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {pfrightboxenv} { O{blanker} O{} }
  {\cs_set:Npn\poker@tmpsaved{\pokerbox[#1][scale=-1,#2]
    {\rightoffset,\paperheight}
    {(poker above right)}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {pmainboxenv} { O{blanker} O{} }
  {\cs_set:Npn\poker@tmpsaved{\pokerbox[#1][#2]
    {\paperwidth-\leftoffset-\rightoffset,\paperheight-\topoffset-\botoffset}
    {(offset below left)}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {ptopboxenv} { O{blanker} O{} }
  {\cs_set:Npn\poker@tmpsaved{\pokerbox[#1][#2]
    {\paperwidth-\leftoffset-\rightoffset,\topoffset}
    {(offset above left)}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {pbotboxenv} { O{blanker} O{} }
  {\cs_set:Npn\poker@tmpsaved{\pokerbox[#1][#2]
    {\paperwidth-\leftoffset-\rightoffset,\botoffset}
    {(poker below left-|offset below left)}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {pwholeboxenv} { O{blanker} O{} }
  {\cs_set:Nn\poker@tmpsaved{\pokerbox[#1][#2]
    {\paperwidth,\paperheight}{(poker below left)}{\tcbusetemp}}%
    \tcbwritetemp}{\endtcbwritetemp\poker@tmpsaved}

\NewDocumentCommand \pnodebox { O{} m +m }
  {\begin{pgfinterruptpicture}%
    \hbox_gset:Nn\poker@kernel@box{#3}%
  \end{pgfinterruptpicture}%
  \node[at={#2},#1] {\box\poker@kernel@box};}
\NewDocumentCommand \pcenterbox { O{} } {\pnodebox[#1]{(poker center)}}
\NewDocumentEnvironment {pnodeboxenv} { O{} m }
  {\cs_set:Npn\poker@tmpsaved{\pnodebox[#1]{#2}{\tcbusetemp}}\tcbwritetemp}
  {\endtcbwritetemp\poker@tmpsaved}
\NewDocumentEnvironment {pcenterboxenv} { O{} }
  {\cs_set:Npn\poker@tmpsaved{\pnodebox[#1]{(poker center)}{\tcbusetemp}}\tcbwritetemp}
  {\endtcbwritetemp\poker@tmpsaved}

\tikzset{
  /tcb/poker@image@box/.style={},
  /tikz/poker@image@interior/.style={},
  /tikz/poker@image@node/.style={},
  /poker/poker image/.search also={/tikz,/pgf},
  /poker/poker image/box/.code={\tcbset{/tcb/poker@image@box/.style={#1}}},
  /poker/poker image/interior/.code={\tcbset{/tikz/poker@image@interior/.style={#1}}},
  /poker/poker image/node/.code={\tikzset{poker@image@node/.style={#1}}},
}
\NewDocumentCommand\pimagebox{O{}mmmm}{%
  \pgfkeys{/poker/poker image/.cd,#1}
  \pokerbox[empty,interior engine=path,boxrule=0pt,interior style={fill=none,fill overzoom image={#4},path fading=circle with fuzzy edge 20 percent,poker@image@interior},poker@image@box][poker@image@node]{#2}{#3}{#5}}
\box_new:N \poker@textenvbox
\cs_new:Npn\ptextboxenv{\hbox_set:Nw\poker@textenvbox\pgfinterruptpicture}
\cs_new:Npn\endptextboxenv{%
  \endpgfinterruptpicture\hbox_set_end:\pgfqbox{\poker@textenvbox}}
\cs_new:Npn\ptextbox#1{\ptextboxenv#1\endptextboxenv}

\cs_new_nopar:Npx\poker@posi@#1#2{\exp_not:N\node[inner sep=1pt,label={\exp_not:n{[font=\tiny,label distance=-1mm]}#2\tl_to_str:n{:}#1},fill=red] at (#1) {};}
\clist_const:Nn\poker@posi@list{poker above left/below right,poker above right/below left,poker below left/above right,poker below right/above left,offset above left/above,offset above right/above,offset below left/above,offset below right/above,poker center/above,poker right golden/below,poker left golden/below,poker top golden/above,poker bot golden/below,main top golden/below,main bot golden/above}
\cs_new_nopar:Npn\pshowpos{\foreach \i/\j in \poker@posi@list {\poker@posi@\i\j}}
\newcommand\pshowgrid[1][]{
  \begin{scope}[shift=(poker center)]
    \draw[step=5mm,#1](offset below left) grid (offset above right);
  \end{scope}}
\newcommand\pshowsmallgrid[2][]{
  \begin{scope}[shift=(poker center)]
    \draw[step=#2,color=blue,line width=.2pt,opacity=.4,#1](offset below left) grid (offset above right);
  \end{scope}}

\box_new:N \poker@textbox
\NewDocumentCommand\pboxlefttext{ O{} O{} m }
  {\pleftbox[blanker,top=3mm,left=1mm,halign=center,poker@name@box@style,#1][poker@name@node@style,#2]{\Large\pokercharfontfa\linespread{0.9}\selectfont#3}}
\NewDocumentCommand\pboxrighttext{ O{} O{} m }
  {\pfrightbox[blanker,top=3mm,left=1mm,halign=center,poker@name@box@style,#1][poker@name@node@style,#2]{\Large\pokercharfontfa\linespread{0.9}\selectfont#3}}

\poker_space_reset: