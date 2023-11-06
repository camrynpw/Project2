# Introduction
#Play short music clip
# Play first audio
path_1 = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/guitar.wav"

sample path_1, finish: 0.5, sustain: 5, release: 2
sleep sample_duration path_1

# Play first audio
path1 = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/Intro.wav"
sample path1

# Get the duration of the audio sample
duration1 = sample_duration path1

# Sleep for the same duration as the audio
sleep duration1

# Play common sounds for brushing group
# Define the multipliers for volume and echo delays
volume_multiplier = 0.07
echo_multiplier = 0.2

# Brushing group
# Specify the path to the folder where the .wav files are located
B_path = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/B"

# List of file names
B_file_names = [
  "B_MAT01_EU_FN_RIT01_102.wav",
  "B_SPI01_EU_MN_NAI01_103.wav",
  "B_IND01_EU_FN_ELI01_101.wav",
  "B_WHO01_MC_FI_SIM01_302.wav",
  "B_ANI01_MC_FN_SIM01_301.wav",
  "B_BAC01_MC_MN_SIM01_102.wav",
  "B_CAN01_EU_FN_GIA01_309.wav"
]

# List of volume parameters for each sample
B_volume_parameters = [30, 14, 7, 1, 4, 10, 11].map { |vol| vol * volume_multiplier }

# List of echo values
B_echo_delays = [30, 11, 7, 17, 14, 6, 11].map { |delay| delay * echo_multiplier }

# Function to create an echo effect with decreasing volume
define :echo_sound do |file, volume, delay|
  with_fx :reverb, room: 0.1, mix: 0.1 do
    delay.times do |i|  # Adjust the number of echoes
      sample file, amp: volume / (i + 1)
      sleep 0.7
    end
  end
  sleep 0.7
end
# Iterate through the list of file names and sample parameters
in_thread do
  B_file_names.zip(B_volume_parameters, B_echo_delays).each do |file_name, volume, delay|
    file_path = File.join(B_path, file_name)
    echo_sound(file_path, volume, delay)
    sample :perc_bell, amp: 0.1
    sleep 2
  end
end

sleep 35

#Audio introducing feeding group
path2 = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/recording_2.wav"
sample path2

# Get the duration of the audio sample
duration2 = sample_duration path2

# Sleep for the same duration as the audio
sleep duration2

# Feeding group
# Specify the path to the folder where the .wav files are located
F_path = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/F"

# List of file names
F_file_names = [
  "F_BAC01_MC_MN_SIM01_105.wav",
  "F_BRI01_MC_FI_SIM01_102.wav",
  "F_CAN01_EU_FN_GIA01_201.wav",
  "F_DAK01_MC_FN_SIM01_303.wav",
  "F_LEO01_EU_MI_RIT01_105.wav",
  "F_MAG01_EU_FN_FED01_202.wav"
]

# List of volume parameters for each sample
F_volume_parameters = [19, 9, 40, 6, 10, 7].map { |vol| vol * volume_multiplier }

# List of echo values
F_echo_delays = [19, 9, 40, 6, 10, 7].map { |delay| delay * echo_multiplier }


# Iterate through the list of file names and sample parameters
in_thread do
  F_file_names.zip(F_volume_parameters, F_echo_delays).each do |file_name, volume, delay|
    file_path = File.join(F_path, file_name)
    echo_sound(file_path, volume, delay)
    sample :perc_bell, amp: 0.1
    sleep 2
  end
end

sleep 31

#Insert audio introducing isolation group
path3=  "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/recording_3.wav"
sample path3

# Get the duration of the audio sample
duration3 = sample_duration path3

# Sleep for the same duration as the audio
sleep duration3

# Isolation group
# Specify the path to the folder where the .wav files are located
I_path = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/I"

# List of file names
I_file_names = [
  "I_ANI01_MC_FN_SIM01_104.wav",
  "I_BLE01_EU_FN_DEL01_106.wav",
  "I_CLE01_EU_FN_FER01_103.wav",
  "I_NUL01_MC_MI_SIM01_203.wav"
]

# List of volume parameters for each sample
I_volume_parameters = [10, 70, 15, 20].map { |vol| vol * volume_multiplier }

# List of echo values
I_echo_delays = [10, 70, 15, 20].map { |delay| delay * echo_multiplier }


# Iterate through the list of file names and sample parameters
in_thread do
  I_file_names.zip(I_volume_parameters, I_echo_delays).each do |file_name, volume, delay|
    file_path = File.join(I_path, file_name)
    echo_sound(file_path, volume, delay)
    sample :perc_bell, amp: 0.1
    sleep 2
  end
end

sleep 30


#Insert audio for next section
path4 = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/recording_4.wav"
sample path4

# Get the duration of the audio sample
duration4 = sample_duration path4

# Sleep for the same duration as the audio
sleep duration4

#Insert brush noise audio
pathb = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/brushing.wav"
sample pathb

# Get the duration of the audio sample
durationb = sample_duration pathb

# Sleep for the same duration as the audio
sleep durationb


#Play brush group overlapping meows
# folder for brushing noises
B_folder_path = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/B/B_test"
# Get a list of all .wav files in the folder
B_wav_files = Dir["#{B_folder_path}/*.wav"]

# Initialize an array to hold the sound objects
B_sounds = []

# Load and play each .wav file simultaneously
in_thread do
  B_wav_files.each do |file|
    # Load the .wav file and store it in the sounds array
    B_sounds << sample(file)
  end
  
  # Play all the loaded .wav files simultaneously
  control B_sounds do
    sleep sample_duration(sounds[0]) # Sleep for the duration of the first sound
  end
end

sleep 6

#(play kibble noise)
#Insert kibble noise audio
pathk = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/kibble.wav"
sample pathk, amp: 2.0

# Get the duration of the audio sample
durationk = sample_duration pathk

# Sleep for the same duration as the audio
sleep durationk

#(play feeding group overlapping meows)
#folder for feeding noises
F_folder_path = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/F/F_test"
# Get a list of all .wav files in the folder
F_wav_files = Dir["#{F_folder_path}/*.wav"]

# Initialize an array to hold the sound objects
F_sounds = []

# Load and play each .wav file simultaneously
in_thread do
  F_wav_files.each do |file|
    # Load the .wav file and store it in the sounds array
    F_sounds << sample(file)
  end
  
  # Play all the loaded .wav files simultaneously
  control F_sounds do
    sleep sample_duration(sounds[0]) # Sleep for the duration of the first sound
  end
end

sleep 4

#(play metal bars noise)
pathm = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/metal.wav"
sample pathm

# Get the duration of the audio sample
durationm = sample_duration pathm

# Sleep for the same duration as the audio
sleep durationm

#(play isolation group overlapping meows)
# Folder for isolation noises
I_folder_path = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/I/I_test"
# Get a list of all .wav files in the folder
I_wav_files = Dir["#{I_folder_path}/*.wav"]

# Initialize an array to hold the sound objects
I_sounds = []

# Load and play each .wav file simultaneously
in_thread do
  I_wav_files.each do |file|
    # Load the .wav file and store it in the sounds array
    I_sounds << sample(file)
  end
  
  # Play all the loaded .wav files simultaneously
  control I_sounds do
    sleep sample_duration(sounds[0]) # Sleep for the duration of the first sound
  end
end

sleep 4

#Insert brush noise audio
path5 = "/Users/camrynpettenger-willey/Desktop/CS200/cat_dataset/recording_5.wav"
sample path5

# Get the duration of the audio sample
duration5 = sample_duration path5




