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
��dappst eVTg��Ԋ��!
�����`P��h%$�!Ʉ�L 57R�i�[=���X��[�����ǥn_(>Z�G�Z{�>`����v������������ν�z�����AO��8nތ(�/�C0�=�ߵ#s|ci(�����r�p�o<��'�;/LX�*S�
��܇!��h�|�a%�K(�!�1�$��	��� ����ꮣ���w�;1���To�aa*_��ڹ3�ŇΊ��b�H�#a�݁�%ζ����0����e�M�;	N�YH;�&P�H��$�:���|U<7��,-r��.�O��̺X"z�r�ruR^� ��~0I�l�%�?��w&q��)�]'!�FR����������ʅ/�e�&������]q���B�rx��#�sϤ$�1{G4�=&b��j�TWh��Y`6�8�i~6�N��%��`~ݣ�����~��:��q;ފ;�p�,0����o�Uiđ�\q���̙Ïm�.BV���]V�~�G/�#.N޵Jk`�MdK$��T�X��b&p�O�� �L�hEu����7��3��2s{mx�Ɋ��Ҹ��Eη�G?�p��|�m�f#���]�tw����9)^d@���E�r)��Esd����lG�o��P�m� ��U 4l8E*?(�ұ��DiA��͵b���F.�cϗ$�
B��V��tz=z|S�y����D7�w����H���ţ&t��V�zN(��)1r��P�y)ʞK�o�����ZU2;�L����X�����"���?����z�Ӻ-�@I���W����!M����O5f��0ߕys�����Q��4ʥ�3~�zS��Y+���e$��H�O�~�vy�����]�6�/SV.i2
x�s��=Pi��3W������d���=��� T8����m9�1Ƚ�󶬵��9��m�4�4Mt�5�K����e���L1O�0���4	S��
�6ĵ�UR=�����]yx|��Vh|�pk��NI�|RW+]�,/�f{]Z�`.����PM�@B_��c1�؝qEh�R_�ds��5�@!+4��+s��K�ӱ�j{���ɪ/Q"Uʯߝ\S�_ �[h(���Ģ��8Y�\,SL�9y��K��9"�A*˞����Ϭ	�����Ly*�J�����)�l�13#[f|V"�g
��v�m�V;��F4%ޔAհl��u}L�U]��R +hDJ
�M梿�K�Kd*r��R�
�/3�ʌ�Mx�9��"˰�9�ݳ#L1?�?+MrH�-O�͸,�T/ą�b�܈���~q�\g�UP�K{�LV���9(Kz�[P�����/Ԃ�$T�Bf����ۂ��k���D7�w�|�2}8(y��K��e�����}���?:��ɭ�u�����ԁ9� �zp��T���R���@(�^p}T��⅐-�5���{�U{����}�ܻ>��ur�k���M5����mO]�(r���g����pªB����?�>�;#��U(���bf|q�Ư�
�
��j�f��q�n�Xn�:���m��WcC���u"��;��ֶ9��5x1o�
ff�~5�9�1v��؋��7��',qI6���;�{~���[,餿�����
V���O��=~&�;,�>��L��'m�pN��<+��][��s����� ����ۼ�kK��JQ��h^�/$oɦ|6�������`��O �
mF<�4�	�h��0��:}hf��&Q��FTO����;@a%���R�F1a�Pq��>�t�T���&���D�Iyɰ,+K�*���~7Z	J�VZ,p9�E��(�:��A���vr-XM��������h�O����U{g�K���󒈏�T�j��U�}L������Ǹ�c��no��[Y��O���{G/k�T���U2������0Z>�t�_F����ȷ\W�G��¦�Gu֣���hݞ��~Hb4H�[�/ �K,^��8ռ|=�2gS �}εz�����~˔�1�H,pGK���4�a�_��a�e�l�O̤��� ����O���7�, �Y�� [��x`=6�h�Ă8�;�Ƀ�J�ҬZ=��0W���y\�$���h�ݻw�����K�+���"Z�<�		i��#ܵzJ~�E�������I�T�K_"?@�A���~و-:�j?��L��Q������퉞Ѱ4�Fo8�����$�o�h����)D��Ȩ�>��iL뻖��q�X�M������L�B��Ų4���h0��06�� ��ٜ��GZMܛ���݄��u�Й�C��A �Q�"7<�
er��I�Ug�lxi�j�ay�Ib���R�(c��r�d/�z�}bzK7�� �����t�ϸZ��;��!F�
 h8<ȑd��S�&��<$���C��1����_ �:�R�,{�U�"�yKw���X��dA�Pq�Ȼ .t�}_���Gvq�̗�m��Ӡ}��'�`_&�`J`F���k$�e9�&x���=q[���{����n2�j�����.��pZ����Yn�O��pLձn  