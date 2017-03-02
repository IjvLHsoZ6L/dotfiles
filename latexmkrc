#! /usr/bin/perl

$use_japaese = 1;

if ($use_japaese) {
  $pdf_mode = 3;
  $latex    = 'platex %O %S';
  $dvipdf   = 'dvipdfmx %O %S';
} else {
  $pdf_mode = 1;
  $pdflatex = 'pdflatex %O %S';
}

$pdf_previewer = 'evince %O %S';
