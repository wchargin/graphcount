\documentclass{article}

%include polycode.fmt
%format phi = "\varphi"

\title{Exploring graphs in Haskell}
\author{William Chargin}
\date{9~January 2016}

\usepackage{amsmath}
\usepackage{zi4}
\usepackage{xcolor}
\definecolor{haskellpurple}{HTML}{5c4e84}
\usepackage{mdframed}
\newmdenv[
  skipabove=7pt,
  skipbelow=7pt,
  rightline=false,
  leftline=true,
  topline=false,
  bottomline=false,
  backgroundcolor=haskellpurple!10,
  linecolor=haskellpurple,
  innerleftmargin=5pt,
  innerrightmargin=5pt,
  innertopmargin=5pt,
  innerbottommargin=5pt,
  leftmargin=0cm,
  rightmargin=0cm,
  linewidth=4pt,
]{haskellbox}
\newenvironment{haskellnote}[1][]{
  \begin{haskellbox}\sffamily\textbf{#1}\\
}{
  \end{haskellbox}
}

\begin{document}

\maketitle

\subsection*{Introduction}

This program ports a specific Mathematica notebook to Haskell.
In doing so, we hope to write a more easily understandable program.

The code comprises three modules.
In |CAS|, we implement a \emph{very} basic CAS
so that we can write and evaluate symbolic expressions.
In |Liese|, we port some code provide by Dr.~Liese
as a preamble to the problem.
Finally, in |Main|, we present the solution to the problem.

The reader is not assumed to have any Haskell knowledge.
We'll see how this goes\ldots

\subsection*{A quick note on notation}

This document is written in Literate Haskell;
the source for the document is also the Haskell source!

Usually, Literate Haskell does quite a good job with the formatting.
However, it does rather poorly with infix operator sections.
Thus, we explicitly explain the following notations:
\begin{itemize}
  \item
    the expression |(2 /)| is called an \emph{left operator section},
    and represents a function that will divide |2| by its argument,
    so it is the same as |\x -> 2 / x|;
  \item
    the expression |(/ 2)| is called an \emph{right operator section},
    and represents a function that will divide its argument by |2|,
    so it is the same as |\x -> x / 2|;
  \item
    the expression |x `div` y| is entered @x `div` y@,
    and is the same as |div x y|;
    that is, it treats |div| as an infix operator
    and applies it to two operands;
  \item
    the expression |(`div` 3)| is written @(`div` 3)@,
    and it is a \emph{right infix operator section},
    which does exactly what you think it would do
    (it is equivalent to |\x -> x `div` 3|).
\end{itemize}
The only really confusing one of these is the last,
where the lack of space between the trailing @`@ and the @3@
can make these expressions difficult to read.
Sorry about that!

\subsection*{A quick note on notes}

From time to time, you may come across notes like these:

\begin{haskellnote}[The |data| and |type| keywords]
These two keywords are different.
Note that |data| creates a \emph{new} data type
with one or more data constructors.
On the other hand, |type| merely creates a type alias
so that we can refer to existing types with a shorter name.
\end{haskellnote}

These are notes about the Haskell language itself.

%include src/CAS.lhs
%include src/Liese.lhs
%include src/Main.lhs

\end{document}
