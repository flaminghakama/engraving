\version "2.22.0"

%
%  Used to remove poet and composer from running header
%  presumably when header would be duplicated 
%  from the author Helge Kruse <Helge.Kruse@gmx.net>:
%    Bookpart first page and last page predicates
%
%  Usage:
%            \on-the-fly #not-part-first-page \fromproperty #'header:poet
%
#(define (not-part-first-page layout props arg)
   (if (= (chain-assoc-get 'page:page-number props -1)
          (ly:output-def-lookup layout 'first-page-number))
       empty-stencil
       (interpret-markup layout props arg)))

\header {
    source = ""
    style = ""
    copyright = \markup \tiny \copyright 
    lastupdated = ""
    title = \markup { \italic \fontsize #4 \bold \titleFull  }
    subtitle = ""
    poet = ""
    composer = \markup \italic { "composed by " \composerName }
    arranger = \arranger
    tagline = ""
}


