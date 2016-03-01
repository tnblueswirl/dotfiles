" Vim syntax file
" Language: php
" Maintainer: Timothy Madden <terminatorul@gmail.com>
" Last Change: 1 may 2013
" Version:  0.3

if !exists('g:php_annotations_syntax') || g:php_annotations_syntax != 0
    syntax match phpDocCommentLineStart #\v^\s*\*\s*# contained
    syntax region phpAnnotationString start=#"# skip=#\v\\"# end=#"# contained
    syntax region phpAnnotationSimpleString start=#'# skip=#\v\\'# end=#'# contained
    syntax match phpAnnotationNumber #\v[0-9.]+# contained
    syntax match phpAnnotationGrouping #\v[],=[(){}@$><!]# contained
    syntax region phpAnnotationExpressionParenthesis start=#\V(# end=#\V)# contained contains=phpAnnotationExpressionParenthesis, phpAnnotationExpressionBraces, phpAnnotationExpressionBrackets, phpDocCommentLineStart, phpAnnotationString, phpAnnotationSimpleString, phpAnnotationNumber, phpAnnotationGrouping
    syntax region phpAnnotationExpressionBraces start=#\V{# end=#\V}# contained contains=phpAnnotationExpressionParenthesis, phpAnnotationExpressionBraces, phpAnnotationExpressionBrackets, phpDocCommentLineStart, phpAnnotationString, phpAnnotationSimpleString, phpAnnotationNumber, phpAnnotationGrouping
    syntax region phpAnnotationExpressionBrackets start=#\V[# end=#\V]# contained contains=phpAnnotationExpressionParenthesis, phpAnnotationExpressionBraces, phpAnnotationExpressionBrackets, phpDocCommentLineStart, phpAnnotationString, phpAnnotationSimpleString, phpAnnotationNumber, phpAnnotationGrouping

    syntax region phpAnnotation start=#\v^\s*\*?\s*\zs\@# start=#\v/\*\*\s*\zs\@# end=#$# contained contains=phpAnnotationExpressionParenthesis, phpAnnotationExpressionBraces, phpAnnotationExpressionBrackets, phpAnnotationString, phpAnnotationSimpleString, phpAnnotationNumber, phpAnnotationGrouping
    syntax region phpDocComment start=#\v/\*\*# end=#\v\ze\*/# containedin=phpComment contains=phpAnnotation keepend

    highlight link phpDocCommentLineStart Comment
    highlight link phpAnnotationGrouping Operator
    highlight link phpAnnotationNumber Number
    highlight link phpAnnotationString String
    highlight link phpAnnotationSimpleString String
    highlight link phpAnnotationExpressionParenthesis SpecialComment
    highlight link phpAnnotationExpressionBraces SpecialComment
    highlight link phpAnnotationExpressionBrackets SpecialComment
    highlight link phpAnnotation SpecialComment
    highlight link phpDocComment Comment
endif
