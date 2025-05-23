��    f      L  �   |      �  �   �  �   q	  �  i
    ?  �   P  �  M  U    �  Z  �    F  �            &   .     U  !   r     �     �     �  ,   �       .   .  '   ]  (   �     �  %   �     �     �     �  *     �   6  &   �     �          "     >  $   V     {     �  �   �     S     d     m     �     �  <   �  #   �          -     D  "   X     {     �  &   �     �     �     �     �       )   "     L  �   a     [  ;   r  3   �  /   �  +     '   >  #   f     �     �     �  \   �     3     5  4   R     �  !   �  -   �  .   �     %      A      \      t      �      �      �      �      �      �      !     !  ,   .!  *   [!     �!     �!     �!     �!     �!     �!  -   �!      "     ,"  w  -$  r  �%  K  '  H  d*  n  �,  �  .  V  �0  �  33  �  6    9  )   ;  4   <;  `   q;  7   �;  >   
<  3   I<  6   }<  ,   �<  E   �<  0   '=  F   X=  <   �=  A   �=  ;   >  E   Z>     �>     �>     �>  R   �>  �   ?  ;   �?  8   3@  5   l@  ,   �@  (   �@  L   �@  *   EA  2   pA  D  �A  (   �B     C  ?   /C     oC      �C  j   �C  9   D  3   QD  ,   �D  )   �D  M   �D     *E  +   9E  A   eE  2   �E  !   �E  !   �E  .   F     MF  L   fF  )   �F  �  �F      �H  I   �H  =   .I  9   lI  5   �I  1   �I  -   J  )   <J  %   fJ     �J  �   �J     *K  6   .K  X   eK  4   �K  R   �K  Z   FL  z   �L  <   M  <   YM  *   �M  (   �M  E   �M  $   0N  ,   UN  (   �N  *   �N     �N  3   �N  )   (O  S   RO  T   �O     �O     P     9P  %   XP  ?   ~P  *   �P  J   �P     4Q     b   ;   <   8          4   )      *      e   Z      D           [   C       T   %   /       L   2   ,           ]   >   H      S       X                  G                V          =   	          ^   \   N   J      6   ?   M   Q       F   R   $                     7                 K   0       O   9   #           3         !   a   .         E   U   c          :   A   5   (         
       @           W   "   _   -   f         +      1   P                 '   d           `   I   &       B                   Y    
Context control:
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
  -C, --context=NUM         print NUM lines of output context
 
Miscellaneous:
  -s, --no-messages         suppress error messages
  -v, --invert-match        select non-matching lines
  -V, --version             display version information and exit
      --help                display this help text and exit
 
Output control:
  -m, --max-count=NUM       stop after NUM selected lines
  -b, --byte-offset         print the byte offset with output lines
  -n, --line-number         print line number with output lines
      --line-buffered       flush output on every line
  -H, --with-filename       print file name with output lines
  -h, --no-filename         suppress the file name prefix on output
      --label=LABEL         use LABEL as the standard input file name prefix
       --include=GLOB        search only files that match GLOB (a file pattern)
      --exclude=GLOB        skip files that match GLOB
      --exclude-from=FILE   skip files that match any file pattern from FILE
      --exclude-dir=GLOB    skip directories that match GLOB
   -E, --extended-regexp     PATTERNS are extended regular expressions
  -F, --fixed-strings       PATTERNS are strings
  -G, --basic-regexp        PATTERNS are basic regular expressions
  -P, --perl-regexp         PATTERNS are Perl regular expressions
   -I                        equivalent to --binary-files=without-match
  -d, --directories=ACTION  how to handle directories;
                            ACTION is 'read', 'recurse', or 'skip'
  -D, --devices=ACTION      how to handle devices, FIFOs and sockets;
                            ACTION is 'read' or 'skip'
  -r, --recursive           like --directories=recurse
  -R, --dereference-recursive  likewise, but follow all symlinks
   -L, --files-without-match  print only names of FILEs with no selected lines
  -l, --files-with-matches  print only names of FILEs with selected lines
  -c, --count               print only a count of selected lines per FILE
  -T, --initial-tab         make tabs line up (if needed)
  -Z, --null                print 0 byte after FILE name
   -NUM                      same as --context=NUM
      --group-separator=SEP  print SEP on line between matches with context
      --no-group-separator  do not print separator for matches with context
      --color[=WHEN],
      --colour[=WHEN]       use markers to highlight the matching strings;
                            WHEN is 'always', 'never', or 'auto'
  -U, --binary              do not strip CR characters at EOL (MSDOS/Windows)

   -e, --regexp=PATTERNS     use PATTERNS for matching
  -f, --file=FILE           take PATTERNS from FILE
  -i, --ignore-case         ignore case distinctions in patterns and data
      --no-ignore-case      do not ignore case distinctions (default)
  -w, --word-regexp         match only whole words
  -x, --line-regexp         match only whole lines
  -z, --null-data           a data line ends in 0 byte, not newline
   -o, --only-matching       show only nonempty parts of lines that match
  -q, --quiet, --silent     suppress all normal output
      --binary-files=TYPE   assume that binary files are TYPE;
                            TYPE is 'binary', 'text', or 'without-match'
  -a, --text                equivalent to --binary-files=text
 %s home page: <%s>
 %s: binary file matches %s: exceeded PCRE's backtracking limit %s: exhausted PCRE JIT stack %s: input file is also the output %s: internal PCRE error: %d %s: invalid option -- '%c'
 %s: memory exhausted %s: option '%s%s' doesn't allow an argument
 %s: option '%s%s' is ambiguous
 %s: option '%s%s' is ambiguous; possibilities: %s: option '%s%s' requires an argument
 %s: option requires an argument -- '%c'
 %s: unrecognized option '%s%s'
 %s: warning: recursive directory loop ' (C) (standard input) -P supports only unibyte and UTF-8 locales Example: %s -i 'hello world' menu.h main.c
PATTERNS can contain multiple patterns separated by newlines.

Pattern selection and interpretation:
 General help using GNU software: <%s>
 Invalid back reference Invalid character class name Invalid collation character Invalid content of \{\} Invalid preceding regular expression Invalid range end Invalid regular expression License GPLv3+: GNU GPL version 3 or later <%s>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
 Memory exhausted No match No previous regular expression Packaged by %s
 Packaged by %s (%s)
 Perl matching not supported in a --disable-perl-regexp build Premature end of regular expression Regular expression too big Report %s bugs to: %s
 Report bugs to: %s
 Search for PATTERNS in each FILE.
 Success Trailing backslash Try '%s --help' for more information.
 Unknown system error Unmatched ( or \( Unmatched ) or \) Unmatched [, [^, [:, [., or [= Unmatched \{ Usage: %s [OPTION]... PATTERNS [FILE]...
 Valid arguments are: When FILE is '-', read standard input.  With no FILE, read '.' if
recursive, '-' otherwise.  With fewer than two FILEs, assume -h.
Exit status is 0 if any line is selected, 1 otherwise;
if any error occurs and -q is not given, the exit status is 2.
 Written by %s and %s.
 Written by %s, %s, %s,
%s, %s, %s, %s,
%s, %s, and others.
 Written by %s, %s, %s,
%s, %s, %s, %s,
%s, and %s.
 Written by %s, %s, %s,
%s, %s, %s, %s,
and %s.
 Written by %s, %s, %s,
%s, %s, %s, and %s.
 Written by %s, %s, %s,
%s, %s, and %s.
 Written by %s, %s, %s,
%s, and %s.
 Written by %s, %s, %s,
and %s.
 Written by %s, %s, and %s.
 Written by %s.
 Written by Mike Haertel and others; see
<https://git.sv.gnu.org/cgit/grep.git/tree/AUTHORS>. ` ambiguous argument %s for %s character class syntax is [[:space:]], not [:space:] conflicting matchers specified exceeded PCRE's line length limit failed to return to initial working directory failed to set file descriptor text/binary mode input is too large to count invalid argument %s for %s invalid character class invalid content of \{\} invalid context length argument invalid matcher %s invalid max count memory exhausted no syntax specified program error regular expression too big stack overflow the -P option only supports a single pattern unable to record current working directory unbalanced ( unbalanced ) unbalanced [ unfinished \ escape unknown binary-files type unknown devices method warning: --unix-byte-offsets (-u) is obsolete write error Project-Id-Version: grep-3.6.27
Report-Msgid-Bugs-To: bug-grep@gnu.org
PO-Revision-Date: 2021-10-01 21:45+0200
Last-Translator: Мирослав Николић <miroslavnikolic@rocketmail.com>
Language-Team: Serbian <(nothing)>
Language: sr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Bugs: Report translation errors to the Language-Team address.
 
Контроле контекста:
  -B, --before-context=БРОЈ       исписује БРОЈ редова водећег контекста
  -A, --after-context=БРОЈ        исписује БРОЈ редова пратећег контекста
  -C, --context=БРОЈ              исписује БРОЈ редова излазног контекста
 
Разно:
  -s, --no-messages               искључује поруке о грешкама
  -v, --invert-match              бира не-одговарајуће редове
  -V, --version                   исписује податке о издању и излази
      --help                      приказује ову помоћ и излази
 
Излазне контроле:
  -m, --max-count=БРОЈ            зауставља након БРОЈА изабраних редова
  -b, --byte-offset               исписује померај бајта уз редове излаза
  -n, --line-number               исписује број реда уз редове излаза
      --line-buffered             претаче излаз на сваком реду
  -H, --with-filename             исписује назив датотеке са редовима излаза
  -h, --no-filename               потискује додавање префикса називу датотеке на излазу
      --label=НАТПИС              користи НАТПИС као префикс назива датотеке стандардног улаза
       --include=ОПШТЕ             тражи само датотеке које се поклапају са ОПШТЕ (шаблон датотеке)
      --exclude=ОПШТЕ             прескаче датотеке које се поклапају са ОПШТЕ
      --exclude-from=ДАТОТЕКА     прескаче датотеке које се поклапају са било којим шаблоном из ДАТОТЕКЕ
      --exclude-dir=ОПШТЕ         прескаче директоријуме који се поклапају са ОПШТЕ
   -E, --extended-regexp           ШАБЛОНИ су проширени регуларни изрази
  -F, --fixed-strings             ШАБЛОНИ су ниск
  -G, --basic-regexp              ШАБЛОНИ су основни регуларни изрази
  -P, --perl-regexp               ШАБЛОНИ су регуларни изрази Перла
   -I                              исто као и „--binary-files=without-match“
  -d, --directories=РАДЊА         како да рукује директоријумима;
                                  РАДЊА може бити „read“, „recurse“, или „skip“
  -D, --devices=РАДЊА             како да рукује уређајима, ФИФО-има и прикључницама;
                                  РАДЊА може бити „read“ или „skip“
  -r, --recursive                 исто као и „--directories=recurse“
  -R, --dereference-recursive     слично, али прати све симболичке везе
   -L, --files-without-match       исписује само називе ДАТОТЕКА без изабраних редова
  -l, --files-with-matches        исписује само називе ДАТОТЕКА са изабраним редовима
  -c, --count                     исписује само број изабраних редова по ДАТОТЕЦИ
  -T, --initial-tab               помера табове ред горе (ако је потребно)
  -Z, --null                      исписује 0-ти бајт након назива ДАТОТЕКЕ
   -БРОЈ                           исто као „--context=БРОЈ“
      --group-separator=РАЗД      исписује РАЗДВОЈНИК у реду између поклапања са контекстом
      --no-group-separator        не исписује раздвојник за поклапања са контекстом
      --color[=КАДА],
      --colour[=КАДА]             користи обележиваче за истицање поклапајућих ниски
                                  КАДА може бити „always“, „never“ или „auto“.
  -U, --binary                    не исеца ЦР знакове на крају реда (МСДОС/Виндоуз)

   -e, --regexp=ШАБЛОНИ            користи ШАБЛОНЕ за подударање
  -f, --file=ДАТОТЕКА             преузима ШАБЛОНЕ из ДАТОТЕКЕ
  -i, --ignore-case               занемарује разлике величине слова у шаблонима и подацима
      --no-ignore-case            не занемарује разлике величине слова (основно)
  -w, --word-regexp               подудара једино целе речи
  -x, --line-regexp               подудара једино целе редове
  -z, --null-data                 ред података се завршава 0-бајтом, не новим редом
   -o, --only-matching             приказује само непразне делове редова који одговарају
  -q, --quiet, --silent           потискује све нормалне излазе
      --binary-files=ВРСТА        сматра да су извршне датотеке ВРСТЕ;
                                  ВРСТА може бити „binary“, „text“, или „without-match“
  -a, --text                      исто као и „--binary-files=text“
 %s матична страница: <%s>
 %s: бинарна датотека одговара %s: прекорачено је ПЦРЕ-ово ограничење тражења уназад %s: потрошени ПЦРЕ ЈИТ спремник %s: улазна датотека је такође излаз %s: унутрашња грешка ПЦРЕ-а: %d %s: неисправна опција —— „%c“
 %s: меморија је потрошена %s: опција „%s%s“ не дозвољава аргумент
 %s: опција „%s%s“ је нејасна
 %s: опција „%s%s“ је нејасна; могућности: %s: опција „%s%s“ захтева аргумент
 %s: опција захтева аргумент —— „%c“
 %s: непрепознатљива опција „%s%s“
 %s: дубинско вртење кроз директоријуме “ © (стандардни улаз) „-P“ подржава само једнобајтне и УТФ-8 језике Пример: %s -i „hello world“ menu.h main.c
ШАБЛОНИ може да садржи више шаблона раздвојених новим редовима.

Одељак шаблона и тумачења:
 Општа помоћ за Гнуов софтвер: <%s>
 Неисправна повратна референца Неисправан назив класе знака Неисправан знак поретка Неисправан садржај \{\} Неисправан регуларан израз који претходи Неисправан крај опсега Неисправан регуларан израз Лиценца ОЈЛв3+: Гнуова ОЈЛ 3. издање или новије <%s>.
Ово је слободан софтвер: слободни сте да га мењате и расподељујете.
Не постоји НИКАКВА ГАРАНЦИЈА, у оквирима дозвољеним законом.
 Меморија је потрошена Нема подударања Нема претходног регуларног израза Запаковао је %s
 Запаковао је %s (%s)
 Поклапање за Перл није подржано у „--disable-perl-regexp“ извршној Прерани крај регуларног израза Регуларни израз је превелик Грешке %s пријавите на: %s
 Грешке пријавите на: %s
 Тражи наведене ШАБЛОНЕ у свакој ДАТОТЕЦИ.
 Успешно Водећа контра коса црта Пробајте „%s --help“ за више података.
 Непозната системска грешка Не одговара ( или \( Не одговара ) или \) Не одговара [, [^, [:, [., или [= Не одговара \{ Употреба: %s [ОПЦИЈА]... ШАБЛОНИ [ДАТОТЕКА]...
 Исправни аргументи су: Када је ДАТОТЕКА „-“, чита стандардни улаз. Без ДАТОТЕКЕ, чита . ако је дубински,
у супротном „-“. Са мање од две ДАТОТЕКЕ, подразумева се „-h“.
Излазно стање је 0 ако је изабран неки ред, у супротном 1;
ако је дошло до неке грешке а „-q“ није дато, онда је излазно стање 2.
 Написали су %s и %s.
 Написали су %s, %s, %s,
%s, %s, %s, %s,
%s, %s, и други.
 Написали су %s, %s, %s,
%s, %s, %s, %s,
%s, и %s.
 Написали су %s, %s, %s,
%s, %s, %s, %s,
и %s.
 Написали су %s, %s, %s,
%s, %s, %s, и %s.
 Написали су %s, %s, %s,
%s, %s, и %s.
 Написали су %s, %s, %s,
%s, и %s.
 Написали су %s, %s, %s,
и %s.
 Написали су %s, %s, и %s.
 Написао је %s.
 Написали су Мајк Хиртел и други; погледајте
<https://git.sv.gnu.org/cgit/grep.git/tree/AUTHORS>. „ нејасан аргумент „%s“ за „%s“ синтакса класе знака је [[:размак:]], а не [:размак:] наведени су трагачи у сукобу прекорачено је ограничење дужине реда ПЦРЕ-а не могу да се вратим у почетни радни директоријум нисам успео да подесим текстуални/бинарни режим описника датотеке улаз је превелик за пребројавање неисправан аргумент „%s“ за „%s“ неисправна класа знака неисправан садржај \{\} неисправан аргумент дужине контекста неисправан трагач %s неисправан највећи број меморија је потрошена синтакса није наведена грешка програма регуларни израз је превелик прекорачење спремника опција „-P“ подржава само самосталне шаблоне не могу да снимим тренутни радни директоријум неуравнотежена ( неуравнотежена ) неуравнотежена [ недовршена \ излазим непозната врста бинарних датотека непознат метод уређаја упозорење: „--unix-byte-offsets (-u)“ је застарело грешка писања 