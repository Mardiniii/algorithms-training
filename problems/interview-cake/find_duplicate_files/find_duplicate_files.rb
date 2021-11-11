require 'digest'

def find_duplicated_files(starting_directory)
  files_seen_already = {}

  stack = [starting_directory]

  duplicates = []

  while current_path = stack.pop
    if File.directory?(current_path)
      Dir.each_child(current_path) do |filename|
        full_path = File.join(current_path, filename)
        stack.push(full_path)
      end
    else
      file_hash, current_last_edited_time =
        File.open(current_path, 'r') do |file|
          [
            sample_hash_file(file),
            file.mtime # last edited to find the original and duplicate
          ]
        end

      if files_seen_already.key?(file_hash)
        existing_last_edited_time, existing_path = files_seen_already[file_hash]

        if current_last_edited_time > existing_last_edited_time
          duplicates.push([current_path, existing_path])
        else
          duplicates.push([existing_path, current_path])

          # Update the files_seen_already hash to have the new file's info
          files_seen_already[file_hash] = [current_last_edited_time, current_path]
        end
      else
        files_seen_already[file_hash] = [current_last_edited_time, current_path]
      end
    end
  end
end

NUM_BYTES_TO_READ_PER_SAMPLE = 4000

# Take three samples of the file at the beginning, the middle and the end. Use
# the content form these samples to create the hash key. It will reduce the time
# cost of hashing the files to constant time.
def sample_hash_file(file)
  total_bytes = file.size

  hasher = Digest::SHA512.new

  if total_bytes < NUM_BYTES_TO_READ_PER_SAMPLE * 3
    hasher.update(file.read)
  else
    num_bytes_between_samples = (total_bytes - NUM_BYTES_TO_READ_PER_SAMPLE * 3) / 2

    3.times do |offset_multiplier|
      start_of_sampler = offset_multiplier * (NUM_BYTES_TO_READ_PER_SAMPLE + num_bytes_between_samples)
      file.seek(start_of_sampler)

      sample = file.read(NUM_BYTES_TO_READ_PER_SAMPLE)

      hasher.update(sample)
    end
  end

  hasher.hexdigest
end
