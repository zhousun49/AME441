   c   l   e   a   r   ;   c   l   c   
   c   l   o   s   e       a   l   l   
   %   A   s   s   u   m   e       t   h   e       a   c   c   e   l   e   r   a   t   i   o   n       f   r   o   m       0       t   o       1   0   0       k   m   /   h       i   s       5       s   e   c   o   n   d   s       
   %   A   s   s   u   m   e       t   h   a   t       t   h   e       c   a   r       i   s       e   i   t   h   e   r       a   c   c   e   l   e   r   a   t   i   n   g       o   r       s   l   o   w   i   n   g       d   o   w   n   ,       n   e   v   e   r       m   o   v   i   n   g   
   %   a   t       c   o   n   s   t   a   n   t       s   p   e   e   d   
   %   A   s   s   u   m   e       c   o   n   s   t   a   n   t       a   c   c   e   l   e   r   a   t   i   o   n       a   n   d       d   e   c   e   l   e   r   a   t   i   o   n       
   %   3       p   a   r   t   s   :       1   ,       F   i   r   s   t       p   a   r   t   ,       s   t   r   a   i   g   h   t       l   i   n   e   
   %                                       2   ,       S   e   c   o   n   d       p   a   r   t   ,       5       t   u   r   n   s   
   %                                       3   ,       T   h   i   r   d       p   a   r   t   ,       s   t   r   a   i   g   h   t       l   i   n   e   
   %   P   a   r   t       1   :       S   t   a   r   i   g   h   t       l   i   n   e       f   o   r       5   0   0       m   
   A   _   c   r   o   s   s       =       2   1   .   1   9   *   2   .   5   4   *   2   1   .   1   9   *   2   .   5   4   /   2   *   1   0   ^   -   4   +   2   1   .   1   9   *   2   .   5   4   *   1   6   .   9   *   2   .   5   4   *   1   0   ^   -   4   ;   
   %   C   r   o   s   s       s   e   c   t   i   o   n       A   r   e   a       (   m   ^   2   )       o   f       t   h   e       c   a   r   
   d   1       =       5   0   0   ;   
   a   1       =       1   0   0   *   1   0   0   0   /   3   6   0   0   /   5   ;       %   U   n   i   t       t   o       m   /   s   
   t       =       0   ;   
   s   y   m   s       t   1   ;   
   e   q   n       =       d   1       =   =       0   .   5   *   a   1   *   t   1   ^   2   ;   
   t   1       =       e   v   a   l   (   v   p   a   s   o   l   v   e   (   e   q   n   )   )   ;   
   t   _   f   i   r   s   t       =       t   1   (   2   )   ;   
   %   T   i   m   e       p   a   s   s   e   d   
   d   e   l   t   a   t       =       0   .   1   ;   
   v   1       =       z   e   r   o   s   (   r   o   u   n   d   (   t   _   f   i   r   s   t   /   d   e   l   t   a   t   )   ,   1   )   ;   
   t   _   a   r   r   a   y   1       =       z   e   r   o   s   (   r   o   u   n   d   (   t   _   f   i   r   s   t   /   d   e   l   t   a   t   )   ,   1   )   ;   
   f   o   r       i       =       2   :   r   o   u   n   d   (   t   _   f   i   r   s   t   /   d   e   l   t   a   t   )   
                   v   1   (   i   )       =       v   1   (   i   -   1   )       +       a   1   *   d   e   l   t   a   t   ;   
                   t       =       t       +       d   e   l   t   a   t   ;   
                   t   _   a   r   r   a   y   1   (   i   )       =       t   ;   
   e   n   d       
   m       =       8   0   0   *   0   .   4   5   4   ;   
   %   A   s   s   u   m   e   d       6   0   0       p   o   u   n   d       c   a   r       a   n   d       2   0   0       p   o   u   n   d       d   r   i   v   e   r   ,       t   h   i   s       i   s       i   n       k   g   
   F   m   1       =       m   *   a   1   ;   
   F   f   1       =       0   ;   
   F   d   1       =       0   ;   
   %   F   m       i   s       f   o   r   c   e       o   f       t   h   e       c   a   r       +       m   a   n   
   %   F   f       i   s       f   o   r   c   e       o   f       f   r   i   c   t   i   o   n   
   %   F   d       i   s       f   o   r   c   e       o   f       d   r   a   g   
   F   t   o   t   1       =       F   m   1   +   F   f   1   +   F   d   1   ;   
   %   T   o   t   a   l       F   o   r   c   e   
   p   1       =       F   t   o   t   1   *   v   1   ;   
   
   %   P   a   r   t       2   :       F   i   v   e       t   u   r   n   s   
   %   H   e   r   e       w   e       m   a   k   e       a   n   o   t   h   e   r       a   s   s   u   m   p   t   i   o   n   ,       t   h   a   t       w   h   e   n       t   h   e       c   a   r       i   s       s   l   o   w   i   n   g       d   o   w   n   ,       t   h   e   r   e   
   %   i   s       n   o       p   o   w   e   r       g   e   n   e   r   a   t   e   d       f   r   o   m       e   n   g   i   n   e   
   %   A   s   s   u   m   i   n   g       d   i   s   t   a   n   c   e       t   o       s   l   o   w       d   o   w   n       i   s       5   0       m   e   t   e   r   s       a   n   d       t   h   e       c   a   r       s   l   o   w   s       d   o   w   n       i   n       3   
   %   s   e   c   o   n   d   s       
   d   _   s   l   o   w       =       5   0   ;   
   %   t   i   m   e       g   i   v   e   n       t   o       s   l   o   w       d   o   w   n   
   v   _   s   l   o   w       =       2   5   ;   
   %   A   s   s   u   m   e   d       t   a   r   g   e   t       v   e   l   o   c   i   t   y       t   o       r   e   a   c   h       
   s   y   m   s       t   2   s   ;   
   a   _   s   l   o   w       =       (   v   1   (   e   n   d   )   -   v   _   s   l   o   w   )   /   t   2   s   ;   
   e   q   n   1       =       d   _   s   l   o   w       =   =       0   .   5   *   (   -   1   )   *   a   _   s   l   o   w   *   t   2   s   ^   2       +       v   1   (   e   n   d   )   *   t   2   s   ;   
   t   2   s       =       e   v   a   l   (   v   p   a   s   o   l   v   e   (   e   q   n   1   )   )   ;   
   a   _   s   l   o   w       =       (   v   1   (   e   n   d   )   -   v   _   s   l   o   w   )   /   t   2   s   ;   
   %   A   f   t   e   r       s   l   o   w   i   n   g       d   o   w   n   ,       t   h   e   n       t   h   e       c   a   r       w   i   l   l       s   p   e   e   d       u   p       t   o       e   n   t   e   r       a   n   o   t   h   e   r       t   u   r   n   
   d   _   a   c   c   e   l   e   r   a   t   i   o   n       =       5   0   ;   
   %   D   i   s   t   a   n   c   e       f   o   r       a   c   c   e   l   e   r   a   t   i   o   n       a   f   t   e   r       c   u   r   v   e   
   s   y   m   s       t   2   a   ;   
   e   q   n   2       =       d   _   a   c   c   e   l   e   r   a   t   i   o   n       =   =       0   .   5   *   a   1   *   t   2   a   ^   2       +       v   _   s   l   o   w   *   t   2   a   ;   
   t   2   a       =       e   v   a   l   (   v   p   a   s   o   l   v   e   (   e   q   n   2   )   )   ;   
   t   2   a       =       t   2   a   (   2   )   ;   
   t   _   a   r   r   a   y   2       =       z   e   r   o   s   (   r   o   u   n   d   (   t   2   s   /   d   e   l   t   a   t   +       t   2   a   /   d   e   l   t   a   t   )   ,   1   )   ;   
   t   _   a   r   r   a   y   2   (   1   )       =       t   _   a   r   r   a   y   1   (   e   n   d   )       +       d   e   l   t   a   t   ;   
   v   2       =       z   e   r   o   s   (   r   o   u   n   d   (   t   2   s   /   d   e   l   t   a   t   +       t   2   a   /   d   e   l   t   a   t   )   ,   1   )   ;   
   v   2   (   1   )       =       v   1   (   e   n   d   )   ;   
   v   2   (   r   o   u   n   d   (   t   2   s   /   d   e   l   t   a   t   )   +   1   )       =       v   _   s   l   o   w   ;   
   f   o   r       i       =       2   :   r   o   u   n   d   (   t   2   s   /   d   e   l   t   a   t   +   t   2   a   /   d   e   l   t   a   t   )   
                   i   f       i       >       1   0   
                               v   2   (   i   )       =       v   2   (   i   -   1   )       +       a   1   *   d   e   l   t   a   t   ;   
                   e   l   s   e       
                               v   2   (   i   )       =       v   2   (   i   -   1   )       -       a   _   s   l   o   w   *   d   e   l   t   a   t   ;   
                   e   n   d   
                   t   _   a   r   r   a   y   2   (   i   )       =       t   _   a   r   r   a   y   2   (   i   -   1   )   +   d   e   l   t   a   t   ;   
   e   n   d   
   F   m   2       =       m   *   a   1   ;   
   F   f   2       =       0   ;   
   F   d   2       =       0   ;   
   F   t   o   t   2       =       F   m   2   +   F   f   2   +   F   d   2   ;   
   p   2       =       F   t   o   t   2   *   v   2   ;   
   %   A   b   o   v   e       c   y   c   l   e       h   a   s       r   u   n       5       t   i   m   e   s   ,       a   n   d       i   t       r   e   a   c   h   e   s       t   h   e       l   a   s   t       p   h   a   s   e   ,       t   h   e   r   e   f   o   r   e   ,       u   s   e   
   %   a   1   ,       t   h   e       a   c   c   e   l   e   r   a   t   i   o   n       i   n       t   h   e       f   i   r   s   t       p   a   r   t       
   
   %   P   a   r   t       3   :       S   t   r   a   i   g   h   t       l   i   n   e       5   0   0   m   
   %   A   s   s   u   m   e       t   h   e       c   a   r       c   o   m   e       o   u   t       o   f       t   h   e       t   u   r   n   s       a   n   d       a   c   c   e   l   e   r   a   t   e       a   g   a   i   n   
   d   3       =       5   0   0   ;       %   D   i   s   t   a   n   c   e       t   o       t   r   a   v   e   l   
   s   y   m   s       t   3   
   e   q   n   3       =       d   3       =   =       0   .   5   *   a   1   *   t   3   ^   2       +       v   _   s   l   o   w   *   t   3   ;   
   t   3       =       e   v   a   l   (   v   p   a   s   o   l   v   e   (   e   q   n   3   )   )   ;   
   t   _   f   i   n   a   l       =       t   3   (   2   )   ;   
   %   A   s   s   u   m   e   d       t   i   m   e   
   t   _   a   r   r   a   y   3       =       z   e   r   o   s   (   r   o   u   n   d   (   t   _   f   i   n   a   l   /   d   e   l   t   a   t   )   ,   1   )   ;   
   t   _   a   r   r   a   y   3   (   1   )       =       t   _   a   r   r   a   y   2   (   e   n   d   )       +       d   e   l   t   a   t   ;   
   v   3       =       z   e   r   o   s   (   r   o   u   n   d   (   t   _   f   i   n   a   l   /   d   e   l   t   a   t   )   ,   1   )   ;   
   v   3   (   1   )       =       v   2   (   e   n   d   )   ;   
   f   o   r       i       =       2   :   r   o   u   n   d   (   t   _   f   i   n   a   l   /   d   e   l   t   a   t   )   
                   v   3   (   i   )       =       v   3   (   i   -   1   )       +       a   1   *   d   e   l   t   a   t   ;   
                   t   _   a   r   r   a   y   3   (   i   )       =       t   _   a   r   r   a   y   3   (   i   -   1   )       +       d   e   l   t   a   t   ;   
   e   n   d   
   F   m   3       =       m   *   a   1   ;   
   F   f   3       =       0   ;   
   F   d   3       =       0   ;   
   F   t   o   t   3       =       F   m   3   +   F   f   3   +   F   d   3   ;   
   p   3       =       F   t   o   t   3   *   v   3   ;   
   
   %   p   l   o   t   s   
   f   i   g   u   r   e   (   )   
   p   l   o   t   (   t   _   a   r   r   a   y   1   ,       v   1   ,       t   _   a   r   r   a   y   2   ,       v   2   ,       t   _   a   r   r   a   y   3   ,       v   3   )   
   x   l   a   b   e   l   (   '   T   i   m   e       (   s   )   '   )   
   y   l   a   b   e   l   (   '   V   e   l   o   c   i   t   y       (   m   /   s   )   '   )   
   t   i   t   l   e   (   '   V   e   l   o   c   i   t   y       V   s       T   i   m   e       G   r   a   p   h   '   )   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
