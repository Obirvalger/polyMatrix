# This file was *autogenerated* from the file matrices.sage
from sage.all_cmdline import *   # import sage library
_sage_const_3 = Integer(3); _sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_5 = Integer(5); _sage_const_4 = Integer(4)#! /usr/bin/env sage
from sage import *

ms5 =  [
  [
    [_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ],
  ],
  [
    [_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ],
  ],
  [
    [_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ],
  ],
  [
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_3 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ],
  ],
  [
    [_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_1 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ],
  ],
  [
    [_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_2 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ],
  ],
  [
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_3 ],
  ],
  [
    [_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ],
  ],
  [
    [_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ],
  ],
  [
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_2 ,_sage_const_3 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ],
  ],
  [
    [_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_1 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ],
  [
    [_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ,_sage_const_3 ],
    [_sage_const_3 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_3 ,_sage_const_2 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ],
  ],
  [
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ,_sage_const_4 ],
    [_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_4 ,_sage_const_0 ,_sage_const_0 ,_sage_const_4 ],
  ]
]

ms5 = map(lambda m: matrix(GF(_sage_const_5 ), m), ms5)

ms3 = [
  [
    [_sage_const_0 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
  ],
  [
    [_sage_const_2 ,_sage_const_2 ,_sage_const_2 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_2 ,_sage_const_2 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_0 ,_sage_const_2 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_2 ,_sage_const_0 ,_sage_const_2 ],
  ],
  [
    [_sage_const_2 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_2 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_0 ,_sage_const_2 ,_sage_const_1 ],
    [_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_2 ],
  ],
  [
    [_sage_const_2 ,_sage_const_2 ,_sage_const_2 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_2 ,_sage_const_2 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_0 ,_sage_const_2 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_2 ,_sage_const_0 ,_sage_const_2 ],
  ],
  [
    [_sage_const_1 ,_sage_const_0 ,_sage_const_2 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_2 ,_sage_const_0 ,_sage_const_1 ],
  ],
  [
    [_sage_const_2 ,_sage_const_2 ,_sage_const_2 ,_sage_const_0 ],
    [_sage_const_0 ,_sage_const_2 ,_sage_const_2 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_0 ,_sage_const_2 ,_sage_const_2 ],
    [_sage_const_2 ,_sage_const_2 ,_sage_const_0 ,_sage_const_2 ],
  ]
]

ms3 = map(lambda m: matrix(GF(_sage_const_3 ), m), ms3)

def kers(k, l):
    return map(lambda m: matrix(GF(k), m).right_kernel(), l)

def unit_kers(k, l):
    n  = len(l[_sage_const_0 ])
    ks = kers(k, l)
    m  = []
    for i in range(k):
        m.append([i] * n)
    return len(filter(lambda y: m == y, map(lambda x: map(list, list(x)), ks))) == len(l)