def mod_inverse(a, m):
    for x in range(1, m):
        if (a * x) % m == 1:
            return x
    return None

def encrypt(public_key, binary):
    encrypted_text = sum(public_key[i] * int(binary[i]) for i in range(len(binary)))
    return encrypted_text

def decrypt(private_key, ciphertext, n):
    decrypted_text = []
    for k in reversed(private_key):
        if ciphertext >= k:
            decrypted_text.append('1')
            ciphertext -= k
        else:
            decrypted_text.append('0')

    return int(''.join(decrypted_text),2)




def main():
    operation = input().strip()

    if operation == 'e':  # Encryption
        public_key = list(map(int, input().strip().split()))

        lines = []
        while True:
            try:
                line = input()
                if line:
                    lines.append(line)
                else:
                    break
            except EOFError:
                break

        for i in lines:
            binary = bin(int(i))[:1:-1]
            ciphertext = encrypt(public_key, binary)
            print(ciphertext)

    elif operation == 'd':  # Decryption
        m, n = map(int, input().strip().split())
        private_key = list(map(int, input().strip().split()))
        lines = []
        while True:
            try:
                line = input()
                if line:
                    lines.append(int(line.strip()))
                else:
                    break
            except EOFError:
                break
        modular_inverse = mod_inverse(m, n)

        if modular_inverse is not None:
            for i in lines:
                plaintext = decrypt(private_key, (i * modular_inverse) % n, n)
                print(plaintext)
        else:
            print("Modular inverse does not exist.")

if __name__ == "__main__":
    main()
