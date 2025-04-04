import edge_tts
import asyncio
import argparse
import os

DEFAULT_VOICE = "sv-SE-SofieNeural"  # Swedish female voice
DEFAULT_RATE = 0  # Normal speed (0%)

async def text_to_speech(text, output_file, voice, rate):
    # Convert numeric rate to string with a percent sign
    rate_str = f"{int(rate):+d}%"
    
    # Create a Communicate instance with the provided text and parameters
    communicate = edge_tts.Communicate(text, voice=voice, rate=rate_str)
    
    # Save the speech output to the specified file
    await communicate.save(output_file)
    print(f"MP3 saved to: {output_file}")

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(
        description="Swedish Text-to-Speech (TTS) using edge-tts with numeric reading speed"
    )
    
    # Accept a string argument directly rather than a file path
    parser.add_argument("text", help="Text to convert to speech")
    parser.add_argument("output_file", help="Path to output MP3 file")
    
    # Optional arguments for rate and voice
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

    # Parse the arguments
    args = parser.parse_args()
    
    # Run the text to speech conversion
    asyncio.run(text_to_speech(args.text, args.output_file, args.voice, args.rate))

if __name__ == "__main__":
    main()
