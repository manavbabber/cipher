namespace Cipher.Ciphers {

    public class Beaufort {

        char[,] beaufort_array = {
            {'A', 'B', 'C', 'D','E'},
            {'F', 'G', 'H', 'I','K'},
            {'L', 'M', 'N', 'O','P'},
            {'Q', 'R', 'S', 'T','U'},
            {'V', 'W', 'X', 'Y','Z'}
        };

        public string encrypt (string plain_text) {
            string cipher_text = "";
            string temp = plain_text.up ();
            unichar character;
            string val = "";

            for (int i = 0; temp.get_next_char (ref i, out character); ) {

                for (int j = 0; j < 5; j++) {
                    for (int k = 0; k < 5; k++) {
                        if (character == beaufort_array[j,k] && (character >= 'A' && character <= 'Z')) {
                            val = ((j+1).to_string ()).concat ((k+1).to_string ());
                        }
                        if (character == 'J') {
                            val = "24";
                        }
                    }
                }
                if (character >= 'A' && character <= 'Z') {
                    cipher_text = cipher_text.concat (val);
                } else {
                    cipher_text = cipher_text.concat (character.to_string ());
                }
            }
            return cipher_text;
        }

        public string decrypt (string cipher_text) {
            string plain_text = "";
            unichar character;
            unichar character_next;
            unichar characterPlain;

            for (int i = 0; cipher_text.get_next_char (ref i, out character); ) {
                if (character >= '0' && character <= '9') {
                    cipher_text.get_next_char (ref i, out character_next);
                    int c1 = int.parse (character.to_string ());
                    int c2 = int.parse (character_next.to_string ());
                    characterPlain = beaufort_array[c1-1,c2-1];
                }
                else {
                    characterPlain = character;
                }
                plain_text = plain_text.concat (characterPlain.to_string ());
            }

            return plain_text.down ();
        }
    }
}
