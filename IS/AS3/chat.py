import random

# Elliptic Curve parameters: y^2 = x^3 + ax + b (mod p)
a = 17  # Replace with your 'a' value
b = 47  # Replace with your 'b' value
p = 167  # Replace with your prime modulo 'p' value

# Base point (x, y) on the curve
base_point = (166,14)  # Replace with your base point

# Generate Alice and Bob's private keys
alice_private_key = 123
bob_private_key = 123

# Compute Alice and Bob's public keys
def point_add(p1, p2):
    x1, y1 = p1
    x2, y2 = p2

    if p1 == (0, 0):
        return p2
    if p2 == (0, 0):
        return p1

    if p1 != p2:
        m = ((y2 - y1) * pow(x2 - x1, -1, p)) % p
    else:
        m = ((3 * x1 ** 2 + a) * pow(2 * y1, -1, p)) % p

    x3 = (m ** 2 - x1 - x2) % p
    y3 = (m * (x1 - x3) - y1) % p

    return (x3, y3)








alice_public_key = base_point
for _ in range(alice_private_key - 1):
    alice_public_key = point_add(alice_public_key, base_point)

bob_public_key = base_point
for _ in range(bob_private_key - 1):
    bob_public_key = point_add(bob_public_key, base_point)

# Compute the shared secret
shared_secret = bob_public_key
for _ in range(alice_private_key - 1):
    shared_secret = point_add(shared_secret, bob_public_key)

# The x-coordinate of the shared secret is the shared key
shared_key = shared_secret

print(f"Shared Secret (x): {shared_key}")
