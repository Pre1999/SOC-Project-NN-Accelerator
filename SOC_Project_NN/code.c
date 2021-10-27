#include <stdio.h>
#include "altera_up_avalon_video_pixel_buffer_dma.h"

int main()
{
  int *LEDS = (int *)0x010201020;
  volatile int *Switches = (int *)0x010201050;
  alt_up_pixel_buffer_dma_dev *pb = alt_up_pixel_buffer_dma_open_dev("/dev/video_pixel_buffer_dma_0");

  alt_up_pixel_buffer_dma_clear_screen(pb, 0);
  alt_up_pixel_buffer_dma_draw_box (pb, 0, 0, 0xFF, 0xFF, 0x001F, 0);

  printf("Hello from Nios II!\n");
  while (1){
    *LEDS = *Switches;
  }
  return 0;
}
