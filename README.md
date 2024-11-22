下载： https://gpac.io/downloads/gpac-nightly-builds/


从 MP4 文件中删除特定轨道/流（这将删除第三个和第四个流）：
`MP4Box -rem 3 -rem 4 file.mp4`

将媒体文件导入到现有 MP4 文件：
`MP4Box -add file.avi my_file.mp4`

将媒体文件导入到新的 MP4 文件：
`MP4Box -add file.avi -new new_file.mp4`

将辅助音轨添加到上一个文件：
`MP4Box -add audio2.mp3 new_file.mp4`

MP4Box 可以从现有容器导入特定媒体。要获取可从容器导入的受支持媒体，请执行以下操作：
`MP4Box -info file`

从容器添加单个音频流：
`MP4Box -add file.mpg#audio new_file.mp4`

从容器添加媒体的特定持续时间：
`MP4Box -add file.mpg#audio:dur=10 new_file.mp4`

调整/更正宽高比不正确的视频流 （DAR = SAR x PAR）：
`MP4Box -par 1=4:3 file.mp4`

要替换音频或字幕轨道上的标签（使用 udta “name” atom，由 vlc 等播放器显示）：
`MP4Box -udta 3:type=name -udta 3:type=name:str="Director Commentary" file.mp4`


MP4Box 可用于为不同的传输协议准备文件，主要是 HTTP 下载或 RTP 流。

要准备用于简单渐进式 HTTP 下载的文件，以下说明将文件数据以 500 毫秒的块交错，以便在下载文件时启用播放 （HTTP FastStart）：
`MP4Box -inter 500 file.mp4`

为了准备 RTP，以下指令将为文件创建 RTP 提示轨道。这使得 DarwinStreamingServer 或 QuickTime Streaming Server 等经典流媒体服务器能够通过 RTSP/RTP 传送文件：
`MP4Box -hint file.mp4`

为了准备自适应流式处理 （MPEG-DASH），以下说明将创建 DASH 清单和关联文件。有关 DASH 的更多信息，请参阅 [[此页面|MP4Box 中的 DASH 支持]]：
`MP4Box -dash 1000 file.mp4`

要准备 CMAF MPEG-DASH 和 HLS：

`MP4Box -dash 1000 file.mp4 -out live.m3u8:dual:cmaf`
`MP4Box -dash 1000 file.mp4 -out live.mpd --dual --cmaf`


MP4Box 可用于对 MPEG-4 场景描述 BIFS 和 LASeR 进行编码，并可用于解码 MPEG-4 场景描述 BIFS 和 LASeR。

要对现有描述进行编码，请执行以下操作：
`MP4Box -mp4 scene.bt`

注意 MP4Box 将尽最大努力将 VRML/X3D 编码为 MPEG-4，但 MPEG-4 并非支持 X3D 或 VRML 扩展中的所有工具。

要将现有 BIFS 磁道解码为 BIFS 文本格式（类似 VRML 的格式）说明：
`MP4Box -bt file.mp4`

要将现有 BIFS 磁道解码为 XMT-A 格式：
`MP4Box -xmt file.mp4`

要将现有 LASeR 轨道解码为 XSR 格式（SAF+LASeR 标记语言）描述：
`MP4Box -lsr file.mp4`

要将现有 LASeR 轨迹的第一个样本解码为 SVG 文件：
`MP4Box -svg file.mp4`
