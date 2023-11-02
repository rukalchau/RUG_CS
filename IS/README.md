## Confusion:
Confusion is a property of a cryptosystem that focuses on making the relationship between the plaintext, the encryption key, and the ciphertext as obscure and complex as possible. In other words, it seeks to create confusion in the mind of an attacker by making it extremely difficult to deduce any meaningful information about the plaintext or the key, even if they have access to the ciphertext.

To achieve confusion, cryptosystems typically use complex mathematical transformations, such as substitution and permutation operations, which can be achieved through various algorithms like substitution ciphers, S-boxes in modern block ciphers, or modular arithmetic operations. The goal is to make it computationally infeasible for an attacker to reverse the encryption process or discover any patterns in the ciphertext that could reveal information about the plaintext or the key.

In essence, confusion ensures that the encrypted data does not provide any direct information about the key or the original message, adding an additional layer of security to the cryptosystem.

## Diffusion:
Diffusion, as a principle of cryptography, involves spreading the influence of each individual part of the plaintext throughout the ciphertext. In simpler terms, it means that a change in one bit or character of the plaintext should affect a large portion of the ciphertext. This property is essential for thwarting attempts to recover information about the plaintext by analyzing the ciphertext's statistical properties.

To achieve diffusion, cryptographic algorithms use operations like transposition and permutation to mix up the input data (plaintext) and produce a highly randomized output (ciphertext). This helps ensure that the characteristics of the plaintext, such as the distribution of characters or bit patterns, do not persist in the ciphertext. In other words, even small changes in the plaintext should result in significant changes throughout the ciphertext.

Diffusion makes it challenging for attackers to make educated guesses or infer information about the original message by analyzing the ciphertext statistically. It adds another layer of defense against various cryptanalysis techniques.

## Perfect Secrecy

"Perfect Secrecy" is defined by requiring a system that after a cryptogram is intercepted by the
enemy the a posteriori probabilities of this cryptogram representing various messages be identically
same as the a priori probabilities of the same messages before the interception.

When something is provably secure, it means “some
statement” regarding it's security can be (has been) proven.