module AttendancesHelper

  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0)) #60.0のように.0と何処かに記述していないと小数点以下が表示されない
  end

  def format_hour(time)
    format("%02d", time.hour) #02=00 ０詰の２桁、d＝10進数
  end
  
  def format_min(time)
    format("%02d", ((time.min / 15) * 15)) #
  end
end