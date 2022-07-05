import axios from 'axios';
import React, { useEffect, useState } from 'react';

import IPage from '../../interfaces/IPage';
import ISupplier from '../../interfaces/ISupplier';

interface DealersSectionProps {
  id: number;
  idSupplier: number;
}

const DealersSection = ({ id, idSupplier }: DealersSectionProps) => {
  // JE CRÉE UN USESTATE AFIN DE STOCKER LA DONNÉE DE MA SECTION ISSU DE L'APPEL AXIOS DANS "PAGE"
  const [page, setPage] = useState<IPage>();
  const [supplier, setSupplier] = useState<ISupplier>();

  // APPEL API AXIOS POUR 1 SECTION
  const getPage = async () => {
    const dealersPage = await axios.get<IPage>(`http://localhost:3000/api/pages/${id}`);
    setPage(dealersPage.data);
  };

  // APPEL API AXIOS POUR 1 SUPPLIER RELIÉ À 1 SECTION
  const getSupplier = async () => {
    const supplierContent = await axios.get<ISupplier>(
      `http://localhost:3000/api/suppliers/${idSupplier}`,
    );
    setSupplier(supplierContent.data);
  };

  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETPAGE
  useEffect(() => {
    getPage();
    getSupplier();
  }, []);

  return (
    <div className="dealersSection">
      {page && supplier && (
        <>
          <div className="dealersSection__text">
            <h2 className="dealersSection__text__subTitle">{page.subTitle}</h2>
            <h2 className="dealersSection__text__sectionTitle">dealers</h2>
            <h2 className="dealersSection__text__outLine">LOCALS</h2>
            <h1 className="dealersSection__text__title">{page.title}</h1>
          </div>
          <div className="dealersSection__supplier">
            <img
              className="dealersSection__supplier__image1"
              src={page.image1}
              alt={page.title}
            />
            <div className="dealersSection__supplier__infos">
              <h3 className="dealersSection__supplier__infos__name">{supplier.name}</h3>
              <h4 className="dealersSection__supplier__infos__location">
                {supplier.location}
              </h4>
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default DealersSection;
