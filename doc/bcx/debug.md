# debug interface

- uses [[DAP]] protocol for [[VSCode]] [[IDE]] interactive debug
- uses [[cppdap]] for [[C++]] runtime under [[Linux]]

We do not need to write a complex adapter that proxies to [[gdb]] or real hardware. Since our language VM executes [[bytecode]] directly, the most efficient approach is to embed the [[DAP]] server directly inside [[VM]] acts as a dedicated debug executable.

VM as a [[DAP]] server:
- runs on developer host, remote embedded Linux node, or [[MCU]]-based device
- interacts with developer's IDE
	- over TCP/IP network (preferred)
	- any generic serial channel (MCUs mostly has no any net interface replaced by USB serial, JTAG/SWD, UART)

## tutorials

- https://www.volcengine.com/article/2348640#1
