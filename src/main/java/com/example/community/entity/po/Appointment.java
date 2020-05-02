package com.example.community.entity.po;

import com.example.community.entity.enums.ServerState;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;

/**
 * 预约实体
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "APPOINTMENT")
public class Appointment extends BaseIdEntity{
    /**
     * 雇主
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "employer_id_")
    private SysUser employer;

    /**
     * 关联的服务信息
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "server_info_id_")
    private ServerInfo serverInfo;

    /**
     * 服务状态
     */
    @Enumerated(EnumType.STRING)
    @Column(name = "server_state_")
    private ServerState serverState;

}
