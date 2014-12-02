#!/usr/bin/env ruby
#
#Station :0.000
#Number of segments :1
#   Segment 1
#       0.000    0.074
#       0.000    0.079 <knuckle>
#       0.000    0.092
#
# First value is the distance from the mid-line and the second value is the
# height from the bottom
#
class StationPoint
  attr_accessor :waterline, :beam, :knuckle

  def initialize(waterline, beam, knuckle = false)
    @waterline = (waterline * 1000.0).to_i
    @beam = (beam * 1000.0).to_i
    @knuckle = knuckle
  end

  def inverse_waterline
    270 - @waterline
  end
end

class Station
  attr_accessor :offset, :no_segments, :segments

  def initialize(offset)
    @offset = (offset * 1000.0).to_i
    @no_segments = 1
    @segments = []
  end

  def display
    off = segments.first.beam
    set = []
    set << segments.first
    segments.each do |seg|
      if seg.knuckle
        set << seg
      end
    end
    set << segments.last
    (0..6).each do |i|
      len = 0.0
      if i < 4
        b = off - set[i].beam
        w = set[i].inverse_waterline
        if i > 0
          b1 = b + set[i-1].beam - off
          w1 = w - set[i-1].inverse_waterline
          len = Math.sqrt(b1*b1 + w1*w1)
        end
      else
        b = off + set[6 - i].beam
        w = set[6 -i].inverse_waterline
      end
      if len > 0.0
        puts "%5d %5d (len %.1f)" % [b, w, len]
      else
        puts "%5d %5d" % [b, w]
      end
    end
    puts
  end
end

#
# Open the file and load the stations.
stations = []
File.open('stations.txt') do |file|
  data_load = false
  station = nil
  segno = -1
  while line = file.gets do
    if line =~ /^Station/
      offset = line.gsub(/.*:/, '').to_f
      station = Station.new(offset)
      segno = -1
    elsif line =~ /^Number of segments/
      nsegs = line.gsub(/.*:/, '').to_i
      station.no_segments = nsegs if station
    elsif line =~ /^   Segment /
      segno = line.gsub(/.*ment /, '').to_i - 1
      if station and segno < station.no_segments
        data_load = true
        station.segments[segno] = [] if station.no_segments > 1
      else
        segno = -1
      end
    elsif line =~ /^End of station/
      stations << station
      station = nil
      data_load = false
    elsif data_load
      args = line.split
      if station and segno >= 0 and args.count >= 2
        sp = StationPoint.new args[1].to_f, args[0].to_f, (args.count > 2 and args[2] == "<knuckle>")
        if station.no_segments > 1
          station.segments[segno] << sp
        else
          station.segments << sp
        end
      end
    end
  end
end

stations.each do |stat|
  if stat.offset % 240 == 0
    bhno = stat.offset / 240
    if bhno == 0
      puts "Transom:"
    else
      puts "Bulkhead #%d:" % bhno
    end
    stat.display
  end
end

puts "Keelson:"
stations.each do |stat|
  puts "%5d %5d" % [stat.offset , stat.segments.last.waterline]
end
