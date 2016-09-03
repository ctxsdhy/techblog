package org.xs.techblog.common.persistence;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;
import org.xs.techblog.common.utils.UuidUtils;

/**
 * 生成Base58的UUID
 */
public class Base58UuidGenerator implements IdentifierGenerator {

    @Override
    public Serializable generate(SessionImplementor session, Object object) throws HibernateException {
        return UuidUtils.base58Uuid();
    }
}