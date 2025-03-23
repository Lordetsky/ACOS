  .data
fin:
  .asciz "testout.txt" # filename for input
error:
  .asciz "Error: failed to open a file."
.text
    # Source
    li a7, 9
    li a0, 256
    ecall
    
    mv s0, a0
    
    li a7, 8
    li a1, 256
    ecall
    
    # Target
    li a7, 9
    li a0, 256
    ecall
    
    mv s1, a0
    
    li a7, 8
    li a1, 256
    ecall
    
    # Buffer size
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 9
    ecall
    mv s3, a0 #buffer
    
    # Read file
     # Open (for reading) an existing file
  li   a7, 1024     # system call for open file
  mv   a0, s0      # input file name
  li   a1, 0        # open for reading (flags are 0: read, 1: write)
  ecall             # open a file (file descriptor returned in a0)

  bltz a0, main.error # exit on errord exit
  mv   s6, a0        # save the file descriptor

main.loop:
  # Write to file just opened
  li   a7, 63       # system call for read from file
  mv   a0, s6       # file descriptor
  mv   a1, s3       # address of buffer to which to write
  mv   a2, t0       # buffer length
  ecall             # read from a file

  bltz a0, main.close # close the file on error and exit
  mv   t0, a0       # save size read
  add  t1, s0, a0   # write zero terminator to end of buffer
  sb   zero, 0(t1)  #

  # Print the buffer read from a file
  li   a7, 4
  mv   a0, s0
  ecall

  # If bytes read = 32, loop.
  beq  t0, s1, main.loop

main.close:
  # Close the file
  li   a7, 57       # system call for close file
  mv   a0, s6       # file descriptor to close
  ecall             # close file

main.exit:
  li   a7, 10
  ecall

main.error:
  li   a7, 4
  la   a0, error
  ecall