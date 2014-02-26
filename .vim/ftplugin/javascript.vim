setlocal makeprg=jslint\ %
"setlocal errorformat=%-P%f,
"                    \%-G/*jslint\ %.%#*/,
"                    \%*[\ ]%n\ %l\\,%c:\ %m,
"                    \%-G\ \ \ \ %.%#,
"                    \%-GNo\ errors\ found.,
"                    \%-Q

setlocal errorformat=%-P%f,
\%E%>\ #%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
\%-G%f\ is\ OK.,%-Q

setlocal shiftwidth=2
setlocal tabstop=2
