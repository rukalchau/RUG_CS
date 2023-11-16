def initialize_rc4(key):
    # Initialize the S-box and key-scheduling algorithm (KSA)
    S = list(range(256))
    j = 0
    for i in range(256):
        j = (j + S[i] + key[i % len(key)]) % 256
        S[i], S[j] = S[j], S[i]
    print(S)
    return S

def generate_keystream(S, data_length):
    # Generate a keystream using the pseudo-random generation algorithm (PRGA)
    i = 0
    j = 0
    keystream = []
    for _ in range(data_length):
        i = (i + 1) % 256
        j = (j + S[i]) % 256
        S[i], S[j] = S[j], S[i]
        k = S[(S[i] + S[j]) % 256]
        keystream.append(k)
    print(keystream)
    return keystream

def rc4_encrypt(plaintext, key):
    S = initialize_rc4(key)
    keystream = generate_keystream(S, len(plaintext))
    ciphertext = [plain_byte ^ keystream_byte for plain_byte, keystream_byte in zip(plaintext, keystream)]
    return bytes(ciphertext)

def rc4_decrypt(ciphertext, key):
    return rc4_encrypt(ciphertext, key)  # RC4 is symmetric, so decryption is the same as encryption




# Example usage:
key = b"SecretKey"  # The key should be a bytes object
plaintext = "Hello, RC4!"  # The plaintext to encrypt

# Encrypt the plaintext
encrypted_data = rc4_encrypt(plaintext.encode(), key)
print(encrypted_data)

# Decrypt the ciphertext

decrypted_data = rc4_decrypt(encrypted_data, key)
print("Decrypted data:", decrypted_data.decode())
