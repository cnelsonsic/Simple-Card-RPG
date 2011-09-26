\title{A Template for Simple RPG Cards}
\author{
		Charles Nelson \\
		Matthew Thompson
}
\date{\today}

\raggedright

\documentclass[13pt]{article}
\usepackage[paperwidth=62mm, 
			paperheight=88mm, 
			top=0.25cm, 
			% if bottomtabs==True:
				bottom=1.5cm, 
			% else:
				bottom=0.25cm,
			% endif
			left=0.25cm, 
			% if righttabs==True:
				right=1.5cm, 
			% else:
				right=0.25cm,
			% endif
			noheadfoot, 
			marginpar=0mm]{geometry}

\def \activetabnumber {${activetab}}%$

\def \numtabs {${numtabs}}%$ %%Rightside tabs

% if bottomtabs==True:
	\def \tabheight {${88/numtabs} mm}%$
	\def \tabwidth {1 cm}
% elif righttabs==True:
	\def \tabheight {1 cm}
	\def \tabwidth {${62/numtabs} mm}%$
% endif

\usepackage[T1]{fontenc}
\usepackage{textcomp}
\usepackage{mathpazo}

\usepackage{tikz}


\newcommand{\rightsidetabs}{
	%%Right-Side Tabs:
	\begin{tikzpicture}[remember picture, overlay]
		\node [shift={(-\tabwidth, -\activetabnumber.\activetabnumber cm)}]  at (current page.north east)
		{%
			\begin{tikzpicture}[remember picture, overlay]
				\draw[very thick] (0,0) -- (\tabwidth , 0) -- (\tabwidth, -\tabwidth) -- (0,-\tabwidth);
			\end{tikzpicture}
		};
	\end{tikzpicture}

	%%Line to show cutting edge for right tabs.
	\begin{tikzpicture}[remember picture, overlay]
		\node [shift={(-\tabwidth, -\activetabnumber.\activetabnumber cm)}]  at (current page.north east)
		{%%
			\begin{tikzpicture}[remember picture, overlay]
				\draw[very thick] (0,0) -- (0, 10cm);
				\draw[very thick] (0,-\tabwidth) -- (0, -10cm);
			\end{tikzpicture}
		};
	\end{tikzpicture}
}

\newcommand{\bottomsidetabs}{
	%%Bottom-Side Tabs:
	\begin{tikzpicture}[remember picture, overlay]
		\node [shift={(\activetabnumber.\activetabnumber cm, \tabwidth )}]  at (current page.south west)
		{%%
			\begin{tikzpicture}[remember picture, overlay]
				\draw[very thick] (0,0) -- (0, -\tabwidth) -- (\tabwidth, -\tabwidth) -- (\tabwidth,0);
			\end{tikzpicture}
		};
	\end{tikzpicture}

	%%Line to show cutting edge for right tabs.
	\begin{tikzpicture}[remember picture, overlay]
		\node [shift={(\activetabnumber.\activetabnumber cm, \tabwidth)}]  at (current page.south west)
		{%%
			\begin{tikzpicture}[remember picture, overlay]
				\draw[very thick] (0,0) -- (-10cm, 0);
				\draw[very thick] (\tabwidth,0) -- (10cm, 0);
			\end{tikzpicture}
		};
	\end{tikzpicture}
}

\newcommand{\border}{
	%%Border:
	%%FIXME: Can't get line thickness thick enough, maybe use boxes instead.
	%%TODO: Don't draw the border on the side with tabs.
	\begin{tikzpicture}[remember picture, overlay]
		\node [shift={(.1, .1)}]  at (current page.north west)
		{%%
			\begin{tikzpicture}[remember picture, overlay]
				\draw[ultra thick] (0,0) -- (62mm, 0) -- (62mm, -87mm) -- (0,-88mm) -- (0,0);
			\end{tikzpicture}
		};
	\end{tikzpicture}
	}

\pagestyle{empty}

\begin{document}

%%\border

% if bottomtabs==True:
	\bottomsidetabs
% elif righttabs==True:
	\rightsidetabs
% endif

\vspace{-1cm}%% Fix tikz' vspace issues

%%Card Name:
\begin{center}
{\textbf{\textsc{\huge{${name}}}}}%%$
\end{center}

%%Maybe a decorative line here

%%Art, if you want it:
% if art:
	\begin{center}
	\includegraphics[width=40mm]{${art}}%$
	\end{center}
% endif

%%Maybe another decorative line here

%%Card Text:
${body_text}%$

\end{document}
