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
�(Ηdappst eVTW�<x� R\�֕1�
2IxH�*Q@X H�(!��I&ffS���a6gٮ�����z��S�(>��h9�a�T�j�#���ڃ���w�v����{���������{���|�H=1$�m��r�t迒!��X~�j50ja���vDhHN�=��'�ϖ��ͺҪ9a1p��xg�����%�B��@��Eʅ�Y(�p#u�S$�2����;IZA8ac�I��V�H�݉�fĒ���i�Ie�h���0u
#iGM�A��
u�6��M��a#
���p�*����_�C��b'M�;&y��8=<����k�����vu�?'���˚d�r��赣�f�v+��
��h؎:J�yiDݸ����E�����pG����s6#��մ.�rh��Z�Bԡ��e�����ЛS�xv����=��`65c5V]�]_��U���#4�p<H��_0r1Y�2�lno��(�a��+*��=<��V��7�Q2Y/�F��>��l0q����&܍:�M�2w�8�w�E�f,�M�m�^��;�1�VG��s2��d����M�5k㜹t���t��%e���s��;r�
���ĺ�R7���j�Hﮏ��gP8M��n��Cq�����ts��D�U�[�ܛ�����G����*�����;�_hu�{����9q�v_�%_TTRC\��}v�<��o����j+
Ͱ��됴L�uղ��~�mrG��FgI;·��g�zG�T	�@�C�dn��)�9�5~3�2\3㹅�{G-��ls�"�������(K�G��/��]�G��ͮ���M���Z���������0��YO�k�e�SJ��z~��ZZ��L�>K8�2T9��kJەX�7j��آ"{^~�j�eÆIP������tbM�3�\�h7k�J������%�l�Ӹ��`2Q%}_�=Q�H�Pe2j4M��a�9r�I����$%��l6ԩ��,u�ԤO5f�3�Is֢l��YT�Βi�o�B� '�������ELݿ�`�f�٫J���7b��S��P]����u�&x1�(W1�d�ʢ�������/�4�7�/�'Dgfh$�4e�:]���������C��Q7Wf�f1�Ɇm�j��L����q��R+ק��SۙI���44�FZ��FF��&��N-�;"6�%UoQN����ՙ�jE:�O��{s+Jï&A9H]�Q C\���a���f����
�P�'� -�s�j1�j\�����0D��y�<l�nMP6OW)�[����t��O�:S�_*�@�?��.h�,�*���^8p�\�v ��% ��'q��J�#����=<�-b�h�����~x7���#�����EcԏL�����%�����`��O��O~�?��A��c�M0߀x�$t��}_���Q���vi�{j�8�l%s��:P ��7(e#|���s[t�z�0Z!O�T�S4��E�-�#` ��' L���Ն!��t��l��b��Ն#�w��	� �Eh��,!�F��І:�2�`e@ʌs��2+8�ȅp���B�F�Hg��Zo����dD��d����_�V nP Z�)�(��p�7)�X��T�^�W�H�����- ��w�zqmp>8����k�Du�Ȗ��rv�+�G�}��,��\����I���a��wWj�t�5�*�����e�s�H"Ln�g?�m���4�t�lԈB1���~�����.�Jj6���'@�
��[E��4�e	Hx3�ӎw{�X$�П抣9�4b
�z[�{D<��TbBRJ@��wl&��82 �z��O7�b� ���}B
TM����B�o<��ۈp��N���?��j֭��B��}����6�c�Y�w�}�g����,\�,��	���������/>� ;HH��~�W��@Q�.���Tê����Y��X|8����*]��
H�`�~�����t-�:0�*��Ϗ�����V	X���S��5��C(�/}�Xb[�2��6BDH�@���R����,��Z�� |���!�`m�R�z24��= ��\�}�0 ��z�i[�D�X|� D�7j5'<k��=k4'��~l�|X�3me<H^�^������~&��h�=��F$�m��tr��� ��`=�X�Hז���h�7�e����B>�� A��xf6� ~�Xe�켵�)B�ؖ��`�n ��{(ٻX��d�b�ƞ�lt�gO�J<�#�nv���`/k�3����k[�������.k��Â�s�*��!!91�8j��g�n���y'�@j���?5FQ�
  