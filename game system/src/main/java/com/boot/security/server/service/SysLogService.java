package com.boot.security.server.service;

import com.boot.security.server.model.SysLogs;

/**
 * 日志service
 * 
 * @author luoluo
 *
 */
public interface SysLogService {

	void save(SysLogs sysLogs);

	void save(Long userId, String module, Boolean flag, String remark);

	void deleteLogs();
}
