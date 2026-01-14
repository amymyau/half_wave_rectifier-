import math

# Configuration
depth = 256  # Total number of addresses
max_val = 255  # 8-bit max value
filename = "rectifier_values.mem"

with open(filename, "w") as f:
    for i in range(depth):
        if i < depth // 2:
            # First 180 degrees: Sine wave
            # We use sin(pi * i / 128) to cover 0 to pi
            angle = math.pi * (i / (depth / 2))
            val = int(max_val * math.sin(angle))
        else:
            # Second 180 degrees: Rectified to zero
            val = 0

        # Write as 2-digit hex
        f.write(f"{val:02x}\n")

print(f"File {filename} generated successfully.")