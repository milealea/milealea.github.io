
#Temperature plot beaver 1
plot_beavers1 <- ggplot(data = beavers1_time, 
                        mapping = aes(x = total_minutes, y = temp)) + 
  geom_point()
plot_beavers1


#Temperature plot beaver 2
plot_beavers2 <- ggplot(data = beavers2_time, 
                        mapping = aes(x = total_minutes, y = temp)) + 
  geom_point()
plot_beavers2

#Temperature plot both beavers simple
plot_beaver3 <- ggplot(data = beavers_complete, 
                        mapping = aes(x = total_minutes, y = temp, color = beaver_id)) + 
  geom_line(mapping = aes(group = beaver_id ))
plot_beaver3

#Plot both beavers more detailed

plot_beavers4 <- ggplot(data = beavers_complete, 
                        mapping = aes(x = total_minutes, y = temp, colour = beaver_id)) + 
  geom_line(mapping = aes(group = beaver_id), 
            alpha = 0.7, linetype = "solid", linewidth = 1.5) +
  scale_colour_manual(name = "Beaver ID",
                      breaks = c("beavers1_time", "beavers2_time"), 
                      values = c("salmon", "purple"),
                      labels = c("Beaver 1", "Beaver 2")) + 
  ggtitle(label = "Body Temperature of two Beavers") +
  xlab(label = "Time (seconds)") +
  ylab(label = "Temperature (°C)")

plot_beavers4