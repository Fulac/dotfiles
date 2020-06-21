#!/usr/bin/perl

$latex = 'platex -interaction=nonstopmode -kanji=utf-8 %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex = 'pbibtex';
$pdf_mode = 3; # use dvipdf
$pdf_update_method = 4;
if ($^O eq 'linux') {
    $pdf_previewer = "mupdf %O %S";
    $pdf_update_command = "mupdf %O %S";
}
elsif ($^O eq 'darwin') {
    $pdf_previewer = "open -a Preview %S";
    $pdf_update_command = "open -a Preview %S";
}
# Prevent latexmk from removing PDF after typeset.
#$pvc_view_file_via_temporary = 0;
