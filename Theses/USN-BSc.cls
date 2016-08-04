%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  USN-BSc.cls                     %%
%%  LaTeX-class for writing theses  %%
%%                                  %%
%%  (c) Dietmar Winkler (me.dwe.no) %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---Identification----
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{USN-BSc}[2016/08/01 Template class for BSc reports and theses]

% --- definitions of options ---
% norsk option:
\newif\if@norsk
\@norskfalse
\DeclareOption{norsk}{\@norsktrue}
\PassOptionsToClass{\if@norsk norsk \else english\fi}{USN-base}

% All other options are passed on to the book class
\DeclareOption*{%
    \typeout{Option \CurrentOption\space is passed to package USN-base!}
    \PassOptionsToClass{\CurrentOption}{USN-base}
}%

% --- execution of options ---
\ProcessOptions*      %% process the options in calling order

% --- load other classes
\LoadClass{USN-base}  %% we reuse the USN-base class

% --- useful commands
\newcommand*{\USNpreface}{\if@norsk Forord\else Preface\fi}

\newcommand{\mysubject}[1]{%
  \if@norsk%
  {Rapport fra #1\@. semesters <Bachelorprosjekt> \the\year}
  \else%
  {Report from \nth{#1} semester Bachelor project \the\year}
  \fi%
}

\newcommand{\USNtitlepage}[8]{%
% #1 subject
% #2 optional figure
% #3 date
% #4 authors
% #5 confidential
% #6 Project partner
% #7 Norwegian Summary
% #8 English Summary
  \subject{\large \mysubject{#1}}
  \title{\mytitle}
  \subtitle{\mysubtitle\\#2}
  \author{\large \myauthor}
  \date{#3}
% --- pdf document settings ---
  \hypersetup{%
    pdftitle = {\mytitle},%
    pdfsubject = {\mysubject{#1}},%
    pdfauthor = {#4}
  }%
\pdfbookmark[0]{\@title}{title}    %% set the correct PDF bookmark
\maketitle%
%
\cleardoubleemptypage              %% fillpage without page number
%
\if@norsk%           %% only display Norwegian summary page for norsk
{% --- norwegian summary page ---
\thispagestyle{sammendrag}
\label{Sammendrag}\pdfbookmark[1]{Sammendrag}{Sammendrag}
\USNtitlehead%
\par\bigskip
{\large \textbf{\mysubject{#1}}}

\begin{tabbing}
    \textbf{Emne:~}   \= \textit{\mysubtitle} \\
    \textbf{Tittel:~} \> \textit{\mytitle}
\end{tabbing}

Rapporten utgjør en del av vurderingsgrunnlaget i emnet.

\textbf{Prosjektgruppe:~} \textit{\myauthor}
\hfill \textbf{Tilgjengelighet:~}
\textit{\ifthenelse{\equal{#5}{yes}}{Fortrolig}{Åpen}}

\begin{tabbing}
  \textbf{Gruppedeltakere:~}  \=
  \begin{minipage}[t]{0.5\textwidth}
    \textit{#4}
  \end{minipage}\\
  ~\\
  \textbf{Veileder:~} \> \textit{\supervisor} \\
  \textbf{Sensor:~}   \> \textit{\examiner}\\
  \textbf{Prosjektpartner:~} \>\textit{#6}
\end{tabbing}
~\\
\textbf{Godkjent for arkivering: }\hrulefill
\vfill
\begin{framed}
\textbf{Sammendrag:}\\
{\small #7}
\end{framed}
%
\cleardoubleemptypage              %% fillpage without page number
}
\else%
{}
\fi%
% --- english abstract page ---
\thispagestyle{summary}
\label{Summary}\pdfbookmark[1]{Summary}{Summary}
\USNtitlehead%
\par\bigskip
\if@norsk{%
  \@norskfalse  % make sure to use the english versions
  {\large \textbf{\mysubject{#1}}}
  \@norsktrue  % back to norsk
}
\else%
{\large \textbf{\mysubject{#1}}}
\fi%

\begin{tabbing}
  \textbf{Course:~}   \= \textit{\mysubtitle} \\
  \textbf{Titel:~} \> \textit{\mytitle}
\end{tabbing}

This report forms part of the basis for assessing the student's performance on the course.

\textbf{Projekt group:} \textit{\myauthor}
\hfill \textbf{Availability:~}
\textit{\ifthenelse{\equal{#5}{yes}}{Confidential}{Open}}

\begin{tabbing}
  \textbf{Group participants:~}  \=
  \begin{minipage}[t]{0.5\textwidth}
    \textit{#4}
  \end{minipage}\\
  ~\\
  \textbf{Supervisor:~} \> \textit{\supervisor} \\
  \textbf{Examiner:~}   \> \textit{\examiner}\\
  \textbf{Project partner:~} \> \textit{#6}
\end{tabbing}
~\\
\textbf{Approved for archiving: }\hrulefill
\vfill
\begin{framed}
  \textbf{Summary:}\\
  {\small #8}
\end{framed}
%
\cleardoubleemptypage              %% fillpage without page number
}