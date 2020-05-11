package com.example.community.repository;

import com.example.community.entity.po.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * 预约表数据操作
 */
public interface AppointmentRepository extends JpaRepository<Appointment,Long> {

    /**
     * 根据住户id查询预约
     * @param employerId
     * @return
     */
    @Query("select a from Appointment a where a.employer.id = :employerId")
    List<Appointment> listByEmployerId(@Param("employerId") Long employerId);

    /**
     * 根据服务信息id查询预约
     * @return
     */
    @Query("select a from Appointment a where a.serverInfo.id = :serverInfoId")
    List<Appointment> listByServerInfoId(@Param("serverInfoId") Long serverInfoId);

}
