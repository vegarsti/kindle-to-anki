filename = "highlights.txt"
with open(filename, "r") as f:
    highlights = f.readlines()

small_highlights = []
for highlight in highlights:
    cleaned = highlight.strip()
    punctuation_to_remove = [".", ",", ";"]
    cleaned = cleaned.translate(
        cleaned.maketrans({key: "" for key in punctuation_to_remove})
    )
    parts = cleaned.split()
    if len(parts) < 4:  # change this later
        words = " ".join(part.lower() for part in parts)
        small_highlights.append(words)
for highlight in small_highlights:
    print(highlight)
