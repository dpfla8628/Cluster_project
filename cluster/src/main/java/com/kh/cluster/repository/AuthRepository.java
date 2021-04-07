package com.kh.cluster.repository;

import com.kh.cluster.entity.AuthMember;

public interface AuthRepository {
	public AuthMember loginNormal(AuthMember member) throws Exception;
}
