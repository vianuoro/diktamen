import edge_tts
import asyncio
import argparse
import os

DEFAULT_VOICE = "sv-SE-SofieNeural"  # Swedish female voice
DEFAULT_RATE = 0  # Normal speed (0%)

async def text_to_speech(input_file, output_file, voice, rate):
    if not os.path.isfile(input_file):
        print(f"Error: File '{input_file}' does not exist.")
        return

    with open(input_file, "r", encoding="utf-8") as file:
        text = file.read()

    # Convert numeric rate to string with a percent sign
    rate_str = f"{rate}%"
    communicate = edge_tts.Communicate(text, voice=voice, rate=rate_str)
    await communicate.save(output_file)
    print(f"MP3 saved to: {output_file}")

def main():
    parser = argparse.ArgumentParser(
        description="Swedish Text-to-Speech (TTS) using edge-tts with numeric reading speed"
    )
    parser.add_argument("input_file", help="Path to input text file (in Swedish)")
    parser.add_argument("output_file", help="Path to output MP3 file")
    parser.add_argument(
        "--rate",
        type=float,
        default=DEFAULT_RATE,
        help="Reading speed as a number (e.g., -20 for slower, 0 for normal, 10 for faster)."
    )
    parser.add_argument(
        "--voice",
        default=DEFAULT_VOICE,
        help="Voice to use (default: sv-SE-SofieNeural)."
    )

    args = parser.parse_args()
    asyncio.run(text_to_speech(args.input_file, args.output_file, args.voice, args.rate))

if __name__ == "__main__":
    main()
