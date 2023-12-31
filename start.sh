#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���dappst eVXW�� a _�R�Ĩ�����AQ@)$I��dB2$����!����!����j��OwW[[�U�Uڈ�,��V���R��V?|T����mw�7����s����{�Z� ���A�
�8���l(�oI� �{Z~�����p(P�cO��� ;P���g���Es֪��&G����o��oz^G�@�u�LJ�R�SZi�KQ{��fx���ĵ��N���Ef�o�#P��\;x���q�sI����=	�'n�ִ�mF�����O�um��af+A���t�5�@�`*�=�ī	&��Fɴ0 nP-�weW͎��:a3Z��D�R�<O��)֤�n> )��&G17.N�!p�i@�HI���`&��¢eŪ�/Fd�LMM%�&Μ�JP�L��^��1ӧ�q:���w��\��!�(����bZ�Xc}y)�Z��%��@X�xڙ\��A���Vm�8�$��H��˰ɲ���S��D�Z�R;e�0��#6Y�X�8as��	D�<��'C6�q50�mD�TZeIUJ�]�a�'�|H*�:�Q�e��O��A|�(yFN�/2��{��6Bgr�oZ��w�v<�Q<΁��e!ڑD��lG�dUucR�gDkT��_�P�����]�N��@MoL9X��.�B��"�݉Iy!/B������-?��V�,S�1��{���ĨJ�L�q��i{��jn�՜��Jc\�Fx4�8����Q��t���T9q���zXU4N,K�eTT�~w�t�`��y;�v������`D(�3 �r�p&J�}��@�(��z��!rK|>RtU4cܺ�=Vw�3v�5Z��J�b|��i���c])�QD���/}��j_�q䐑�us�uM��A�,�̖Ix�SV5���5���ވ�r�Y�V��8�=�!c��&�#��d�Gcڀz�BW��O�޴Z����b\��]�j�#��D�^ٗf��=R��[vd�Ѱ�����C{�I��)Uy��Ѧ���n��dD��fx���n��ޱ ����890(Yfl)�H����Ǟ�M������p�v�wsl���+֛vk�/C�MYEI�ii�E)�0׊h煍dkQC��R~Y���(�����E��.�EV�J��E�Ɇ�j-EU��8I{adn�&���[�5!�W��ۂ\�O�/6�Z��Yd�Y�����92L��6C��(WW.,�w�~��z�1_o4��_�dY�<]!��Q�{4C
�LE��d�ɳf�.e���+�hV�b&*�Lm�����,�)#=Kn���)����u�;��5�G���L���?�*me�LlI�[��f�-���YRy��\�'[Bi�Yr���(eǾ���z�$�hjW%m�l�H�=��oVfP�LY�"U�>x�4�8��S�)�f5t�o���G��{2�=j��Jb���%��f8)+����D~�v�ol�n���󇫒'f�����_l-H_on��JU3�'Fk��<x�)I<>x��o����S�`����
�1�"���ƪq���TC�ς.���~�c ��M\�!�l6�^�7V�)G�us]�話���^���WC�1���ۜ�yv�#�0�bH�w�[�cp��Y�0��k�+
H'��FF�6y� M���D�p Q޴�-�^z%�c�#6���2��jG��F5?}6 ����H�Z+��T`��'yֈe�n�FdkkkKHns�"^����qL_K����-��XL���E�=�y���l�"d�o3d}���]�(�����놡��>�󎖺���jF��s؝-��__������Сn��}]P{��s=�U���T��?���W�;�J?� &?��r}'��MxP�-0qԲ�Co�f��Zi�,K �C��d-j'{���z�u�$��$s�Y�T�L��z���L���@������)f��T��m��ZA1gE�b�@�5�Q�����2�;�j���0�{��%>��Wǯ�Of�^��%�+/�n�v�Н�����}%aN\M��?�ݦ�o�{���tG��N5�C�FΔ�݃�#�N������O��}�s�����)a�Y�W}ɫ���M �E$5��m�iV>��X�/�n����z��	�ӎr	}K�\��Fx��X8+{��b�X	�h��cAE���p�G#[���F����o�F6��Џ0+f�H[��xl���n��4^�}[�beWG�\�\�ux�hA#o�ر�mF�sp�MED59x�SR���!g�c�~`������s��'lP�>E���]�^�n7�l���6�n��\������C��{u���#f�7�+�YeR���¦��� v���!����?��>������0�P�0T�R�$@�\�6��Hsԫ�X�� �	f�Xk�dN�!�f.3,�����Y��C��.�G}��^���(���H�FE��ڗf�kK3����N�����������m���MmT�9���d7�W3���v���G���rx�#Ɉ��nNV�yH��%�����9�����~��g(�Ni���Λ��z0�S��g��J�!�X�Б����C�s7Y 8��g����}D�)O!���x�d�RJ������D�y�敝o޿S��F��;�)����ȉ��a?N{�w~��3�sj�e���o��@�f�  